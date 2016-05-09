class UsersController < ApplicationController

  load_and_authorize_resource

  def show
    @user = User.find(params[:id])
    @events_f = @user.events.limit(4)
    @events_r = @user.events.offset(4)
  end

end