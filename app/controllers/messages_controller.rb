class MessagesController < ApplicationController

  def create
    @message = current_user.messages.build(messages_params)

    if @message.save
      puts '*'*100
      puts 'saved'
    else
      puts 'not saved'
    end

  end

  private

  def messages_params
    params.require(:message).permit(:content, :room_id)
  end
end