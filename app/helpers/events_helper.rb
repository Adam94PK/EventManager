module EventsHelper

	def find_event
		Event.find(params[:event_id])
	end

end
