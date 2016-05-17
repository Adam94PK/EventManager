class Hotel < ActiveRecord::Base
	has_attached_file :picture, styles: { big: "600x600>", medium: "300x300", thumb: "100x100>" }, default_url: ActionController::Base.helpers.asset_path("/assets/default_hotel_:style.png")
  	validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
	has_and_belongs_to_many :events
	belongs_to :user
	has_many :hotel_pictures, dependent: :destroy
	
	validates :name, obscenity: { sanitize: true, replacement: :vowels }
	validates :city, obscenity: { sanitize: true, replacement: :vowels }
	validates :address, obscenity: { sanitize: true, replacement: :vowels }
	validates :description, obscenity: { sanitize: true, replacement: :vowels }
	
end