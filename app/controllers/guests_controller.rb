class GuestsController < ApplicationController

	def new
		@event = find_event
		@guest = @event.guests.build
	end

	def create
		@guest = Guest.find_by email: params[:guest][:email]
		if !@guest.nil?
			find_event.guests<<@guest
			redirect_to events_path
		else
			puts "Uruchomił sie blok else"
			@guest = find_event.guests.create(guest_params)
			if @guest.save
				redirect_to events_path
			else
				flash.now[:dange] = "Niepoprawne dane"
				render 'new'
			end
		end
	end

	private 

	def find_event
		Event.find(params[:event_id])
	end
	def guest_params
		params.require(:guest).permit(:email, :name, :surname)
	end
end
