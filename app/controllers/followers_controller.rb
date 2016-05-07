class FollowersController < ApplicationController
  def create
    event = find_event
    follower = event.followers.build(event_id: event.id, user_id: current_user.id)
    if !(Follower.exists?(follower))
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

