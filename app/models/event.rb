class Event < ActiveRecord::Base
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: ActionController::Base.helpers.asset_path("/assets/default_event_:style.png")
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
	has_and_belongs_to_many :guests
	has_and_belongs_to_many :hotels
	has_many :event_users
	has_many :users, through: :event_users
	has_one :main_page, dependent: :destroy
	has_one :agenda
	has_many :pending_contributors
end
