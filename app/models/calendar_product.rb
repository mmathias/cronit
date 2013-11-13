class CalendarProduct < ActiveRecord::Base
	belongs_to :calendar
	belongs_to :product
end
