FactoryGirl.define do 
  factory :user do
    user_name             "username"
    email                 "username@example.com"
    password              "password"
    password_confirmation "password"
  end
end