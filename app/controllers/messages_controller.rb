class MessagesController < ApplicationController

  def create
    @message = current_user.messages.build(messages_params)

    if @message.save
      ActionCable.server.broadcast 'room_channel', {
        content: @message.content,
        created_at: @message.created_at,
        current_user: current_user.username,
      }
    else
      puts 'not saved'
    end

  end

  private

  def messages_params
    params.require(:message).permit(:content, :room_id)
  end
end
