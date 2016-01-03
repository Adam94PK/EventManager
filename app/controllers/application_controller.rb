class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  include SessionsHelper
  include UsersHelper

  def render_404
  	raise ActionController::RoutingError.new('Not Found')
  end
  
  def is_allowed? restraint
  	if Users::Authorization.new(current_user, restraint).perform
		true
	else
		render_404
	end		
  end
  
end
