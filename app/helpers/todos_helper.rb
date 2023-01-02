module TodosHelper

  def friend_list(friend)
    content_tag(:link, friend.username ,chat_path(friend.id), data: { turbo_frame: 'chat'}, class: 'position-relative ps-2 pe-1')do
      content_tag('span', '', class: sign_in_badget(friend.is_signed_in))
    end
  end

  def sign_in_badget(online)
    base = 'position-absolute p-2 top-10 start-100 translate-middle border border-light rounded-circle '
    base += online ? 'bg-success' : 'bg-danger'
  end

end
