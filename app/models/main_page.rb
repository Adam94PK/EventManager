class MainPage < ActiveRecord::Base
	has_attached_file :jumbotron, styles: { medium: "600x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :jumbotron, content_type: /\Aimage\/.*\Z/
	belongs_to :event
	
	before_save :change_bad_language
	
	private
	@@words = %w[kurw pierdol chuj]
	
	def change_bad_language
		@@words.each do |w|
			self.title.gsub!(w, censored_word(w))
			self.header.gsub!(w, censored_word(w))
			self.content.gsub!(w,censored_word(w))
		end
	end
	
	def censored_word(word)
		length = word.length
		word[0] + ('*' *(length-2)) + word[length-1]
	end
	
end
