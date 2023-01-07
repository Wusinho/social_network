class UserStatusChannel < ApplicationCable::Channel
  def subscribed
    stream_from "UserStatusChannel:#{params[:user_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
