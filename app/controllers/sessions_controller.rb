class SessionsController < ApplicationController

  def new
  end

  def create
  	user = User.find_by user_name: params[:session][:user_name]
  	if user && user.authenticate(params[:session][:pasword])
  		log_in user
  		redirect_to user
  	else
  		flash.now[:danger] = 'Invalid email or password'
  		render 'new'
  	end
  end

  def destroy
    log_out
    redirect_to root_path
  end

end
