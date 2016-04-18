class Ability
  include CanCan::Ability

  def initialize(user)
    puts "CanCANCANCANCNACAN"
    user ||= User.new

    if user.role == "admin"

        can :manage, :all

    elsif user.role == "pro_user"

      alias_action :edit, :update, :destroy, :to => :edu
      can :show, Agenda
      can :manage, Agenda, Agenda do |agenda|
        agenda.event.user_ids.include?(user.id)
      end
      can :manage, Event
      cannot [:edu, :choose_hotels_to_add, :add_hotel, :event_guests], Event, Event do |event|
        !event.user_ids.include?(user.id)
      end
      can :manage, Guest
      can :create, HotelPicture
      can :manage, HotelPicture, HotelPicture do |hotPic|
        hotPic.hotel.user_id == user.id
      end
      can :manage, Hotel
      cannot :edu, Hotel, Hotel do |hotel|
        !hotel.user_id == user.id
      end
      can :manage, MainPage
      cannot :edu, MainPage, MainPage do |page|
        !page.event.user_ids.include?(user.id)
      end
      can :create, PendingContributor
      can [:accept, :destroy], PendingContributor, PendingContributor do |pc|
        pc.event.user_ids.include?(user.id)

      end

    elsif user.role == "user"
      alias_action :index, :show, :to => :read
      can :read, [Agenda, Hotel, MainPage]
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
