class Room < ApplicationRecord
  belongs_to :user

  def self.finder(user_id, friend_id)
    puts user_id
    puts friend_id
    room_1 = Room.find_by(user_id: user_id, friend_id: friend_id)
    room_2 = Room.find_by(user_id: friend_id, friend_id: user_id)

    [room_1, room_2]
  end

end
