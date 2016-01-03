class Event < ActiveRecord::Base
	has_and_belongs_to_many :guests
	belongs_to :user
	has_one :main_page
end
