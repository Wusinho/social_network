class Room < ApplicationRecord
  belongs_to :user

  def finder(user_id, friend_id)
    Room.find_by(user_id: user_id, friend_id: friend_id) ||
      Room.find_by(user_id: friend_id, friend_id: user_id)

  end

end
