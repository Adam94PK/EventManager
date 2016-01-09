require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  
  test "should get index" do
    get :index
    assert_response :success
    assert_template :index
    assert_equal((assigns(:events)),[@one, @two] )
  end

  test "should get show" do
    get :show, id: @one.id
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit , id: @one.id
    assert_response :success
  end

  test "should save event and redirect to show" do
    user = create(:user)
    sign_in user
    puts "THIS IS THE USER ID"
    post :create, event: { 'name' => "the newest event"}
    assert_redirected_to event_path(assigns(:event))
  end

end
