class AdminPanelController < ApplicationController
  def index
  end

  def user_list
    @users = User.order(:user_name).paginate :page => params[:page], :per_page => 5
  end
  
  def user_content
    @user = User.find(params[:id])
    @events = @user.events
    @hotels = @user.hotels
  end
  
end