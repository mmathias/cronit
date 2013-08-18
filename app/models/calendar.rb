class Calendar < ActiveRecord::Base
  has_many :calendar_items, inverse_of: :calendar, dependent: :destroy
  has_many :actions, dependent: :destroy
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
  validates :start_date , presence: true
  validates :how_often, presence: true
  validates :how_long, presence: true

end
