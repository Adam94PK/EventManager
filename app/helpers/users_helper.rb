module UsersHelper
	def can_edit?(params_id)
		puts "current_user #{current_user.id}, params_id #{params_id}"
		puts current_user.id.to_s == params_id ? true : render_404
	end
end
