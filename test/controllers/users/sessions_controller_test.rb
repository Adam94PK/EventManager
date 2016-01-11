require 'test_helper'

class Devise::SessionsControllerTest < ActionController::TestCase

  setup :devise_mapping
  
  test "should get new" do
  	get :new
  	assert_response :success
  end

  private
  
  def devise_mapping
    request.env['devise.mapping'] = Devise.mappings[:user]
  end

end