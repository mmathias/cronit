class Calendar < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
  has_many :calendar_items, dependent: :destroy
  # has_many :actions, dependent: :destroy
  has_many :calendars_products, class_name: "CalendarProduct", dependent: :destroy  
  validates :start_date , presence: true
  validates :how_often, presence: true
  validates :how_long, presence: true
  attr_accessor :products_hash

  # accepts_nested_attributes_for :actions, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :calendars_products

  before_save do

    #logger.debug(self.products_hash)
    if (!self.products_hash.nil? )
      parsed_products = JSON.parse(self.products_hash)
      parsed_products.each do |product|
        self.calendar_products.build(product_id: product["product_id"], quantity: product["quantity"], calendar_id: self.id)
      end
    end
    #logger.debug(self.calendar_products)

    #take the start date + how_long = end_date
    #eg. 10/10/2010 + 1 year
    how_long_splitted = self.how_long.split
    times = how_long_splitted[0].to_i
    period = how_long_splitted[1]
    end_date = self.start_date + times.send(period)
    
    execution_date = self.start_date
    while execution_date < end_date do
      #how_often.index('every');
      #how_often will be hourly, weekly, monthly, yearly
      addition = ''
      often = self.how_often
      case often
      when 'daily'
        addition = 'day' 
      when 'hourly'
        addition = 'hour' 
      when 'weekly'
        addition = 'week' 
      when 'monthly'
        addition = 'month' 
      when 'yearly'
        addition = 'year' 
      end
      execution_date = execution_date + 1.send(addition)
      self.calendar_items.build(execution_date: execution_date, done: false)
    end
  end
end