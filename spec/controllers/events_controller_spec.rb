require 'rails_helper'

RSpec.describe EventsController, type: :controller do
include Devise::TestHelpers
	describe "GET #index" do

		it "renders the index template" do
			get :index

			expect(response).to be_success
			expect(response).to render_template(:index)
		end

		it "loads all events into @events" do
			event1 = Event.create!(name: "Event1", user_id: 2)
			event2 = Event.create!(name: "Event2", user_id: 2)
			get :index

			expect(assigns(:events)).to match_array([event1, event2])
		end
	end

	describe "GET #show_followed" do
		
		context "when user is not logged in" do
			it "loads nothing into @events" do
				get :index
				expect(assigns(:events)).to match_array([])
			end
		end

		
	end

end
