class AdminPanelController < ApplicationController

  #for cancan
  authorize_resource :class => :controller

  def index
  end

  def user_list
    @users = User.where(filtr_by).where(find_user_by).order(:user_name).paginate :page => params[:page], :per_page => 5
  end
  
  def user_content
    @user = User.find(params[:id])
    @events = @user.events
    @hotels = @user.hotels
  end


  private

  def filtr_by
    if params[:keyword].present?
    "#{params[:select_by]} LIKE '#{params[:keyword]}'"
    elsif params[:role].present?
      "role LIKE '#{params[:role]}'"
    end
  end

end