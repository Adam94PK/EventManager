class EventsController < ApplicationController

  #for can can
  load_and_authorize_resource

  def index
    if !params[:event].nil?
      hash = {'city' => 'place', 'newest' => 'created_at DESC', 'soonest' => 'date'}
      @sort_by = params[:event][:sort_by]
      @events = Event.order("#{hash[@sort_by]}").paginate :page => params[:page], :per_page => 6
    else
      @events = Event.all.paginate :page => params[:page], :per_page => 6
    end
  end

  def create
    @event = Event.new(event_params)
    @event.users<<current_user
    if @event.save
      redirect_to @event
    else
      flash.now[:danger] = 'Wrong input data'
      render :new
    end
  end

  def new
    @event = Event.new
  end

  def edit
    @event = find_event
  end

  def show
    @event = find_event
    unless @event.users.include?(current_user)
      redirect_to [@event, @event.main_page] if @event.main_page.present?
    end
    @pending_contributors = @event.pending_contributors
  end

  def update
    @event = find_event
    if @event.update(event_params)
      redirect_to @event
    else
      flash.now[:danger] = 'Wrong input data'
      render :edit
    end
  end

  def destroy
    @event = find_event
    if current_user.present? && @event.users.include?(current_user)
      @event.destroy
      redirect_to action: :index
    else
      redirect_to new_user_session_path
    end
  end

  def publish
    event = find_event :event_id
    event.published = true
    event.save
    redirect_to :back
  end

  def unpublish
    event = find_event :event_id
    event.published = false
    event.save
    redirect_to :back
  end

  def show_followed
    if current_user.present?
      @events = current_user.events
      puts @events.inspect
    end
  end

  def choose_hotels_to_add
    authorize! :choose_hotels_to_add, Event
    city = params[:city]
    @event = find_event :event_id
    if city.present?
      hotels = Hotel.where(["city = ?", city])
      @hotels = hotels - @event.hotels
    else
      hotels = Hotel.all
      @hotels = hotels - @event.hotels
    end
  end

  def choose_hotels_to_delete
    authorize! :choose_hotels_to_delete, Event
    @event = find_event :event_id
    @hotels = @event.hotels
  end

  def add_hotel
    @hotel = Hotel.find(params[:hotel_id])
    @event = find_event
    @event.hotels << @hotel
    flash[:danger] = 'Hotel added to event'
    redirect_to event_choose_hotels_to_add_path(id: @event)
  end

  def delete_hotel
    @event = find_event
    hotel = Hotel.find(params[:hotel_id])
    @event.hotels.delete hotel
    redirect_to event_choose_hotels_to_delete_path(id: @event)
  end

  def show_event_hotels
    @event = find_event :event_id
    @hotels = @event.hotels
  end

  def event_guests
    @guests = find_event(:event_id).guests
  end

  def search
    @events = Event.where("LOWER(name) LIKE LOWER('%#{params[:event][:name]}%')").paginate :page => params[:page], :per_page => 6
  end

  def category
    @events = Event.where("category LIKE '%#{params[:event][:category]}%'")
  end

  private
  def event_params
  	params.require(:event).permit(:user_id, :name, :place, :date, :time, :description, :avatar, :category)
  end
  def find_event(sym = :id)
  	Event.find(params[sym])
  end
end
