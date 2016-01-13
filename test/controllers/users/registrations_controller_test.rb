require 'test_helper'

class Devise::RegistrationsControllerTest < ActionController::TestCase

	setup :devise_mapping

	test "shuld get new" do
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

	test "shuld create only one same user" do
		user = attributes_for(:user)
		assert_difference 'User.count' do
			post :create, user: user
			post :create, user: user
		end
	end

	test "should get edit when user is signed_in" do
		user = create(:user)
		sign_in user
		get :edit
		assert_response :success
	end

	test "should update user when is signed_in" do
		
	end


	private
	def devise_mapping
		request.env['devise.mapping'] = Devise.mappings[:user]
	end

end