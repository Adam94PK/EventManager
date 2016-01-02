class Ability
  include CanCan::Ability

  def initialize(user)
    puts "Jestem w KONSTRUKTORZE CANCAN Ability"
    user ||= User.new
    if user.role == "admin"
        puts "admin cancan JESTEM W ŚRDOKU"
        can :manage, :all
    elsif user.role == "pro_user"
        puts "pro_user cancan JESTEM W ŚRDOKU"
        can :manage, :all
    else
        puts "else cancan JESTEM W ŚRDOKU"
        can :manage, :all
    end
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
