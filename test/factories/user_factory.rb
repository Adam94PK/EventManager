FactoryGirl.define do
	factory :user do
		sequence(:user_name) {|n| "user#{n}"}
		sequence(:email) {|n| "email#{n}@example.com"}
		name {Faker::Name.first_name }
		surname { Faker::Name.last_name }
		company_name { Faker::Company.name }
		role "user"
		password "password"
		password_confirmation "password"

		factory :user_with_events do
			transient do
				events_count 1
			end

			after(:create) do |user, evaluator|
				create_list(:event, evaluator.events_count, user: user)
			end
		end
	end

end
