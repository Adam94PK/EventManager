class AdminPanelController < ApplicationController
  def index
  end

  def user_list
    @users = User.order(:user_name).paginate :page => params[:page], :per_page => 5
  end
  
end