class RoomChannel < ApplicationCable::Channel
  def subscribed
    if current_user && params[:room_id]
      p '*'*100
      p params
      p '*'*100
      stream_from "room_channel_#{params[:room_id]}"
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
