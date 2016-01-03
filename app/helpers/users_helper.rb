module UsersHelper
=begin
	def is_allowed? restraint
		unless Users::Authorization.new(current_user, restraint).perform
			not_found
		end		
	end
=end
end
