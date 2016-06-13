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

    attr_reader :user, :restraint

    Role = { admin: 3, pro_user: 2, user: 1, guest: 0 }.freeze
    def include_restraint?(restraint)
      Role[restraint] <= Role[user.role.to_sym] if restraint.present?
    end
  end
end
