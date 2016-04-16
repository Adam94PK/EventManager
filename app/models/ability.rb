class Ability
  include CanCan::Ability

  def initialize(user)
    puts "CanCANCANCANCNACAN"
    user ||= User.new
    if user.role == "admin"
        can :manage, :all
    elsif user.role == "pro_user"
        can [:show, :index], Event
        can :edit, Event, Event do |event|
          event.user_ids.include?(user.id)
        end
        can :manage, MainPage
        cannot :edit, MainPage, MainPage do |page|
          !page.event.user_ids.include?(user.id)
        end
    elsif user.role == "user"
      alias_action :index, :show, :to => :read
      can :read, [Agenda, Hotel, MainPage, User]
      can [:read, :show_event_hotels, :search, :category], Event
      can [:create, :new], Guest
      can :read, :static_pages
    else

    end
    # Define abilities for the passed in user here. For example:
    #
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
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
