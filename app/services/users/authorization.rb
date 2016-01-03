module Users
	class Authorization
		def initialize(user, restraint)
			@user = user
			@restraint = restraint
		end

		def perform
			if user
				include_restraint?(restraint) ? true : nil
			end
		end

		private

		Role = { admin: 3, pro_user: 2, user: 1, quest: 0}
		def include_restraint?(restraint)
			if restraint.present?
				restraint =< Role[user.role]
			end
		end

	end