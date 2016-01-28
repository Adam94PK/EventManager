class Hotel < ActiveRecord::Base
	has_attached_file :picture, styles: { medium: "600x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
	has_and_belongs_to_many :events
	belongs_to :user
	has_many :hotel_pictures
end