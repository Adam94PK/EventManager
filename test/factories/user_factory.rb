FactoryGirl.define do
	factory :user do
		user_name { Faker::Name.first_name }
		sequence :email do |n|
			"email#{n}@example.com"
		end
		role "user"
		name {Faker::Name.first_name }
		surname { Faker::Name.last_name }
		password "password"
		password_confirmation "password"
	end
end
