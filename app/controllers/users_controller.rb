class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @events = @user.events
  end

end