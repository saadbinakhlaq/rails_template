FactoryBot.define do
  factory :post do
    account { nil }
    title { "MyString" }
    description { "MyText" }
    status { "MyString" }
  end
end
