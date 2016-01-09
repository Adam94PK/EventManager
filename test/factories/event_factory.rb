FactoryGirl.define do
	factory :event do
		name { Faker::Book.title }
	end
end
