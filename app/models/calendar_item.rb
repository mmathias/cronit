class CalendarItem < ActiveRecord::Base
  belongs_to :calendar
  validates :calendar, presence: true
end
