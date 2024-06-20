FactoryBot.define do
  factory :address do
    street { "MyString" }
    postal_code { "MyString" }
    city { "MyString" }
    state { "MyString" }
    country { "MyString" }
    addressable { nil }
  end
end
