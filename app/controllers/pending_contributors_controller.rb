class PendingContributorsController < ApplicationController
  # for can can
  load_and_authorize_resource

  def create
    @event = find_event
    @pending_contributor = @event.pending_contributors.build(pending_contributor_params)
    @pending_contributor.user = current_user
    @pending_contributor.save
    flash[:danger] = 'Sucesfully added to pending contributors'
    redirect_to @event
  end

  def accept
    @event = find_event
    pending_contributor = PendingContributor.find(params[:id])
    user = pending_contributor.user
    role = pending_contributor.role
    pending_contributor.destroy
    event_user = EventUser.new
    event_user.event = @event
    event_user.user = user
    event_user.role = role
    event_user.save
    redirect_to @event
  end

  def destroy
    event = find_event
    pending_contributor = PendingContributor.find(params[:id])
    pending_contributor.destroy
    redirect_to event
  end

  private

  def pending_contributor_params
    params.require(:pending_contributor).permit(:role)
  end

  def find_event
    Event.find(params[:event_id])
  end
end
