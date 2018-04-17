#no factories outside of this block!
FactoryBot.define do
  factory :user do
    email "plumbum@lead.com"
    password "megatron"
    first_name "Peter"
    last_name "Lead"
    admin false
  end
end
#no factories outside of this block!