class Thought < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }

  validates :user_id,presence: true
  validates :content,presence: true
  validates :title,length: {maximum: 250}
end
