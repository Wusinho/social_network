class Post < ApplicationRecord
  belongs_to :user
  belongs_to :creator, class_name: 'User', foreign_key: :user_id
  validates :body, presence: true
  scope :newest_first, -> { order(created_at: :desc) }

end
