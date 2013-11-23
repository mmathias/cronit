class Product < ActiveRecord::Base
	belongs_to :business
	has_many :calendars_products, class_name: "CalendarProduct", dependent: :destroy
	validates :name, presence: true, length: { maximum: 50 }	
	validates :description, presence: true, length: { maximum: 150 }	
	validates :price, presence: true
end
