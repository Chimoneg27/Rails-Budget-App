FactoryBot.define do
  factory :purchase do
    name { 'cheese' }
    amount { 100 }
    author_id { association(:user).id }
  end
end
