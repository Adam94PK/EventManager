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

		factory :user_with_events do
			transient do
				events_count 2
			end

			after(:create) do |user, evaluator|
				create_list(:event, evaluator.events_count, user: user)
			end
		end
	end
end
