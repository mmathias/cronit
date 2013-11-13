class CalendarItem < ActiveRecord::Base
  belongs_to :calendar
  validates :calendar, presence: true
  validates :execution_date, presence: true
  validates :done, :inclusion => [true,false]
end
