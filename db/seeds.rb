users = %i[ Omar Heber Joao Kelly Maria Antonio]

users.each do |user|
  User.create(username: user, email: "#{user}@gmail.com", password: 123456, password_confirmation: 123456)
end

todo = 'First message'

users= User.all

users.each do |user|
  Todo.create(user_id: user.id, body: todo)
end
