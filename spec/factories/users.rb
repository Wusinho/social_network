FactoryBot.define do
  factory :user do
    email { 'heber@gmail.com' }
    username { 'heber'}
    password { '123456' }
    password_confirmation { '123456' }
  end
end
