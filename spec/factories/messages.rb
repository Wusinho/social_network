FactoryBot.define do
  factory :message do
    user
    room
    content { "MyString" }
  end
end
