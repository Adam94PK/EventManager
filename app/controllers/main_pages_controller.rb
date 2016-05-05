class MainPagesController < ApplicationController

	#for can can
	load_and_authorize_resource

	def create
		@event = find_event
		@main_page = @event.build_main_page(main_page_params)
		if @main_page.save
			redirect_to event_main_page_path(@event.id, @main_page)
		else
			flash.now[:danger] = "Unpermited paramters"
			render 'new'
		end
	end

	def new
		@event = find_event
		@event.build_main_page
	end

	def edit
		@event = find_event
	end

	def show
		@main_page = find_page
		@event = find_event
		@admin_id = @event.user_ids.first
		@admin_name = User.where(id: @admin_id).select(:user_name).take
		@guests_count = @event.guests.length
		@show_contributor = false
		if current_user.present?
			@show_contributor = true
			contributors = @event.pending_contributors
			contributors.each do |c|
				if c.user_id == current_user.id
					@show_contributor = false
					break
				end
			end
		end
	end

	def update
		@main_page = find_page
		if @main_page.update(main_page_params)
			redirect_to event_main_page_path(@main_page.event, @main_page)
		else
			render 'edit'
		end
	end

	def destroy
		@main_page = find_page
		@event = @main_page.event
		if @event.users.include?(current_user)
			@main_page.destroy
			redirect_to @event
		else
			flash[:dange] = "You are not allowd to do that"
		end
	end


	private

	def main_page_params
		params.require(:main_page).permit(:title, :header, :content, :jumbotron)
	end

	def find_page
		MainPage.find(params[:id])
	end
	def find_event
		Event.find(params[:event_id])
	end


end
