module TodosHelper

  def message__chat(user)
    base = 'message '
    if user == current_user
      base += 'me'
    else
      base += 'mb-3'
    end
    base
  end

  def sign_in_badget(online)
    base = 'position-absolute p-2 top-10 start-100 translate-middle border border-light rounded-circle '
    base += online ? 'bg-success' : 'bg-danger'
  end

end
