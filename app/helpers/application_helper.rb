module ApplicationHelper
  def resource_name
    :user
  end

  def resource_class
    User
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def room_finder(friend_id)
    room = Room.finder(current_user.id, friend_id)
    room.id
  end

end
