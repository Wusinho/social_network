class MessagesController < ApplicationController

  def create
    @message = current_user.messages.build(messages_params)

    if @message.save
      ActionCable.server.broadcast "room_channel_#{params[:message][:room_id]}",
                                   {
                                     user_message_id: @message.user.id,
                                     mine: MessagesController.render(partial: 'message/my_message', locals: { message: @message}),
                                     other: MessagesController.render(partial: 'message/others_message', locals: { message: @message})
        # content: @message.content,
        # author_id: @message.user.id,
        # created_at: created_format(@message),
        # current_user: current_user.username,
      }
    else
      puts 'not saved'
    end

  end

  private

  def created_format(message)
    message_date = message.created_at.strftime('%Y-%m-%d').to_date
    today = Date.today
    if message_date == today
      'Today'
    elsif today - message_date == 1
      'Yesterday'
    else
      message_date
    end
  end

  def messages_params
    params.require(:message).permit(:content, :room_id)
  end
end
