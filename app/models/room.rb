class Room < ApplicationRecord
  belongs_to :user
  belongs_to :friend_id, class_name: 'User', foreign_key: :friend_id
  # has_many :pending_invitations, -> { where confirmed: false }, class_name: 'Invitation', foreign_key: 'friend_id'

end
