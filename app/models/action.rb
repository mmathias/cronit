class Action < ActiveRecord::Base
  belongs_to :calendar
  validates :calendar_id, presence: true
  default_scope -> { order('created_at DESC') }
end
