class Action < ActiveRecord::Base
  belongs_to :calendars
  validates :calendar_id, presence: true
end
