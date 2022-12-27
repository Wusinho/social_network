FactoryBot.define do
  factory :invitation do
    user
    friend_id { 1 }
    confirmed { false }
  end
end
