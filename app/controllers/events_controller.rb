class EventsController < ApplicationController
  def index
  	@events = Event.all
  end

  def show_followed
    if current_user.present?
      @events = Event.where(user_id: current_user.id.to_s).to_a
      puts @events.inspect    
    end
  end

  def new
  	@event = Event.new
  end

  def create
  	@event = current_user.events.build(event_params)
  	if @event.save
  		redirect_to @event
  	else
  		flash.now[:danger] = 'Nie poprawne dane'
  		render :new
  	end
  end

  def show
  	@event = find_event
  end

  def edit
  	@event = find_event
  end

  def destroy
  	@event = find_event
  	@event.destroy
  	redirect_to action: :index
  end

  private
  def event_params
  	params.require(:event).permit(:user_id, :name)  	
  end
  def find_event
  	Event.find(params[:id])
  end
end