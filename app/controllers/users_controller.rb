class UsersController < ApplicationController
  
  def index
    is_allowed? :admin
  	@users = User.all
  end

  def new
  	@user = User.new
  end
  
  def create
  	@user = User.new(user_params)
  	if @user.save
      log_in @user
  		redirect_to @user
  	else
      flash.now[:danger] = 'Niepoprawne dane uzytkownika'
  		render 'new'
  	end
  end
  
  def show
  	@user = find_user
  end
  
  def edit
    can_edit? params[:id]
  	@user = find_user
  end

  def update
  	@user = find_user

  	if @user.update(user_params)
  		redirect_to @user
  	else
  		puts "Nie udało się edytować"
  		render 'edit'
  	end
  end
  
  def destroy
  	@user = find_user
  	@user.destroy
  	redirect_to action: "index"

  end

  private
  	def user_params
  		params.require(:user).permit(:name, :surname, :user_name, :company_name, :email, :email_confirmation, :role, :password, :password_confirmation)
  	end
  	def find_user
  		User.find(params[:id])
  	end
end