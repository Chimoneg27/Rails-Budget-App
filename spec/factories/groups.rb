FactoryBot.define do
  factory :group do
    name { 'Fries' }
    icon { 'sword' }
    amount { 27 }
    user_id { association(:user).id }
  end
end
