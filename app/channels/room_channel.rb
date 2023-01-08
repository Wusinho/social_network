class RoomChannel < ApplicationCable::Channel
  def subscribed
    if current_user && params[:friend_id]
      @room = Room.finder(current_user.id, params[:friend_id])
      stream_from "room_channel_#{@room.id}"
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
