class FollowersController < ApplicationController
  def create
    @event = find_event
    user = current_user
    follower = Follower.new
    #follower = @event.followers.new
    follower.event_id = @event.id
    follower.user_id = user.id
    if !(Follower.exists?(event_id: follower.event_id, user_id: follower.user_id))
      follower.save
      flash[:dange] = "Event followed"
      redirect_to :back
    else
      flash[:dange] = "You are already following this event"
      redirect_to :back
    end
  end

  def destroy
    event = find_event
    follower = Follower.where(user_id: current_user).where(event_id: event.id).first
    follower.destroy
    redirect_to :back
  end

  private

  def find_event
    Event.find(params[:id])
  end
end

