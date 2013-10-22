class CalendarItem < ActiveRecord::Base
  belongs_to :calendar
  has_one :product
  validates :calendar, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :execution_date, presence: true
  validates :done, :inclusion => [true,false]
end
