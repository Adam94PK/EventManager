require 'test_helper'

class Devise::RegistrationsControllerTest < ActionController::TestCase

	setup :devise_mapping

	test "shuld pass" do
		get :new
		assert_response :success
	end

	test "should register new user" do
		user = attributes_for(:user)
		assert_difference 'User.count' do 
			post :create, user: user
		end
		assert_redirected_to root_path
	end

	test "shuld render new for invalid user" do
		user = attributes_for(:user)
		user[:email] = "123"
		assert_no_difference 'User.count' do
			post :create, user: user
		end
		# should I test it in controller tes?
		assert_template 'new'
	end

	private
	def devise_mapping
		request.env['devise.mapping'] = Devise.mappings[:user]
	end

end