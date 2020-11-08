FactoryBot.define do
  factory :post do
    image {'test.png'}
    decription {'hogehoge'}
    user
  end
end