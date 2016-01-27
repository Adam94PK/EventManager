class Hotel < ActiveRecord::Base
	has_and_belongs_to_many :events
	belongs_to :user
	has_many :hotel_pictures
end