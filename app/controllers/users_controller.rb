class UsersController < ApplicationController

  #for can can
  load_and_authorize_resource

  def show
    @user = User.find(params[:id])
    @events = @user.events
  end

end