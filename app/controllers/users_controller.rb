class UsersController < ApplicationController

  load_and_authorize_resource

  def show
    @user = find_user
    @events_f = @user.events.limit(4)
    @events_r = @user.events.offset(4)
  end

  def ban
    @user = find_user
    @user.banned = true
    @user.save
    redirect_to :back
  end

  def unban
    @user = find_user
    @user.banned = false
    @user.save
    redirect_to :back
  end

  private

  def find_user
    User.find(params[:user_id])
  end

end