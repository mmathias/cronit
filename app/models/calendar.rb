class Calendar < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
  has_many :calendar_items, dependent: :destroy
  has_many :actions, dependent: :destroy
  validates :start_date , presence: true
  validates :how_often, presence: true
  validates :how_long, presence: true
#  validates :calendar_items, presence: true
#  validates :actions, presence: true

end
