class Agenda < ActiveRecord::Base
	has_attached_file :picture, styles: { medium: "600x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
	belongs_to :event
	validates_uniqueness_of :event_id
end
