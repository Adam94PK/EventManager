class PendingContributorsController < ApplicationController

	def create
		@event = find_event
		@pending_contributor = @event.pending_contributors.build(pending_contributor_params)
		@pending_contributor.user = current_user
		@pending_contributor.save
		flash[:danger] = "Sucesfully added to pending contributors"
		redirect_to @event
	end

	private
	def pending_contributor_params
		params.require(:pending_contributor).permit(:role)
	end
	def find_event
		Event.find(params[:event_id])
	end

end
