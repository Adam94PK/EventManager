class AdminPanelController < ApplicationController
  def index
  end

  def user_list
    @temp = params
    @users = User.where(find_user_by).order(:user_name).paginate :page => params[:page], :per_page => 5
  end
  
  def user_content
    @user = User.find(params[:id])
    @events = @user.events
    @hotels = @user.hotels
  end

  private

  def find_user_by
    if params[:keyword].present?
      "#{params[:select_by]} LIKE '#{params[:keyword]}'"
    end
  end

end