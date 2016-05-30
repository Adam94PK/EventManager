class User < ActiveRecord::Base

  #bundle exec rake assets:precompile
  has_attached_file :avatar, styles: { icon: "200x200" }, default_url: ActionController::Base.helpers.asset_path("user-default.png")
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:login]
  
  has_many :event_users
  has_many :events, through: :event_users
  has_many :followers, dependent: :destroy
  has_many :hotels
  has_many :pending_contributors
  has_many :comments, dependent: :destroy
	
  validates :email, presence: true, uniqueness: { case_sensitive: false }
	validates :user_name, presence: true, uniqueness: { case_sensitive: false }
  
  validates_format_of :user_name, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  
	def login=(login)
    @login = login
  end

  def login
    @login || self.user_name || self.email
  end
  
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
     if login = conditions.delete(:login)
      where(conditions.to_hash).where(["lower(user_name) = :value OR lower(email) = :value", { :value => login.downcase }]).first
     else
      conditions[:email].downcase! if conditions[:email]
			where(conditions.to_hash).first
    end
  end
    

	
	#validates :name, length: { in: 3..30, message: "name long" }, allow_blank: true
	#validates :surname, length: { in: 4..30, message: "surname long" }, allow_blank: true
	#validates :user_name, uniqueness: true, presence: true, length: { in: 3..30, message: "user_name long" }, exclusion: { in: %w(hitler chuj kurwa), message: "user_name exclusion"}
	#validates :company_name, length: { in: 4..60, message: "company_name long" }, allow_blank: true
	#validates :email, uniqueness: true, confirmation: true, presence: true, length: {maximum: 100 }
	#validates :email_confirmation, presence: true
	#validates :role, inclusion: { in: %w(admin pro_user user), message: "role inclusion" }
	#validates :password, presence: true, length: { in: 6..20, message: "password long" }

end
