#no factories outside of this block!
FactoryBot.define do

  sequence(:email) { |n| "user#{n}@example.com" }

  factory :user do
    email 
    password "megatron"
    first_name "Peter"
    last_name "Lead"
    admin false
  end

  factory :admin, class: User do
  email 
  password "qwertyuiop"
  admin true
  first_name "Admin"
  last_name "User"
  end
  
end  
#no factories outside of this block!