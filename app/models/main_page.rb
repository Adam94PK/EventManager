class MainPage < ActiveRecord::Base
	has_attached_file :jumbotron, styles: { medium: "600x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :jumbotron, content_type: /\Aimage\/.*\Z/
	belongs_to :event
	
  validates :title, obscenity: { sanitize: true, replacement: :vowels }
  validates :header, obscenity: { sanitize: true, replacement: :vowels }
  validates :content, obscenity: { sanitize: true, replacement: :vowels }

end
