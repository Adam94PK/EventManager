class User < ActiveRecord::Base
	has_secure_password
	validates :name, length: { in: 3..30, message: "name long" }, allow_blank: true
	validates :surname, length: { in: 4..30, message: "surname long" }, allow_blank: true
	validates :user_name, uniqueness: true, presence: true, length: { in: 3..30, message: "user_name long" }, exclusion: { in: %w(hitler chuj kurwa), message: "user_name exclusion"}
	validates :company_name, length: { in: 4..60, message: "company_name long" }, allow_blank: true
	validates :email, uniqueness: true, confirmation: true, presence: true, length: {maximum: 100 }
	validates :email_confirmation, presence: true
	validates :role, inclusion: { in: %w(admin pro_user user), message: "role inclusion" }
	validates :password, presence: true, length: { in: 6..20, message: "password long" }


	#The available roles
	Roles = [ :admin, :pro_user, :user, :quest ]
	def is?(requested_role)
		self.role == requested_role.to_s
	end
	
end
