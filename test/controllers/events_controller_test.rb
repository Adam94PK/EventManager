require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  
  setup :initialize_events

  test "should get index" do
    get :index
    assert_response :success
    assert_template :index 
    assert_equal (assigns(:events)), Event.all
  end

  test "should get show" do
    get :show, id: @user1.events[Random.rand(21)]
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit , id: @user1.events[Random.rand(21)]
    assert_response :success
  end

  test "should create new evet when user is sign_in" do
    user = create(:user)
    sign_in user
    post :create, event: { 'name' => "the newest event"}
    assert_redirected_to event_path(assigns(:event))
  end


  test "should get only asocieted events when user is signed_in" do
    sign_in @user1
    get :show_followed
    assert_response :success
    assert_equal((assigns(:events)), @user1.events )
    assert_not_includes (assigns(:events)), @user2.events.first
  end

  test "should get no events when user is not signed_in" do
    get :show_followed
    assert_response :success
    assert_nil(assigns(:events))
  end

  test "shuld redirect destroy when user in not signed_in" do
    event = @user1.events[Random.rand(21)]
    assert_no_difference 'Event.count' do
      delete :destroy, id: event
    end
    assert_redirected_to new_user_session_path
  end

  private

  def initialize_events
    @user1 = create(:user_with_events, events_count: 20)
    @user2 = create(:user_with_events, events_count: 10)
  end

end
