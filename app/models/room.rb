class Room < ApplicationRecord
  belongs_to :user
  has_many :messages, -> () { order(created_at: :desc)}

  def self.finder(user_id, friend_id)
    room_1 = Room.find_by(user_id: user_id, friend_id: friend_id)
    return room_1 if room_1.present?
    room_2 = Room.find_by(user_id: friend_id, friend_id: user_id)
    return room_2 if room_2.present?
  end
end
