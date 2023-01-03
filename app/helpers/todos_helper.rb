module TodosHelper

  def message__chat(user)
    base = 'message '
    base += 'me' if user == current_user
    base
  end

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

  def sign_in_badget(online)
    base = 'position-absolute p-2 top-10 start-100 translate-middle border border-light rounded-circle '
    base += online ? 'bg-success' : 'bg-danger'
  end

end
