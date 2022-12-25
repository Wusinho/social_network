FactoryBot.define do
  factory :message do
    user { nil }
    rooom { nil }
    content { "MyString" }
  end
end
