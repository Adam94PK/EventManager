class EventsController < ApplicationController
  load_and_authorize_resource
  def index
  	@events = Event.all
  end

  def show_followed
    if current_user.present?
      @events = current_user.events
      puts @events.inspect    
    end
  end

  def new
  	@event = Event.new
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

  def show
  	@event = find_event
    unless @event.users.include?(current_user)
      redirect_to [@event, @event.main_page] if @event.main_page.present?
    end
    @pending_contributors = @event.pending_contributors
  end

  def edit
  	@event = find_event
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

  def search
    @events = Event.where("name LIKE '%#{params[:event][:name]}%'")
  end

  private
  def event_params
  	params.require(:event).permit(:user_id, :name, :place, :date, :time, :description, :avatar)  	
  end
  def find_event
  	Event.find(params[:id])
  end
end
