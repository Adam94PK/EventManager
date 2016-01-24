class MainPagesController < ApplicationController

	def new
		@event = find_event
		@event.build_main_page
	end

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

	def update
		@main_page = find_page
		if @main_page.update(main_page_params)
			redirect_to event_main_page_path(@main_page.event, @main_page)
		else
			render 'edit'
		end
	end

	def edit
		@event = find_event
	end

	def destroy
		@main_page = find_page
		@event = @main_page.event
		if current_user == @event.user
			@main_page.destroy
			redirect_to @event
		else
			flash[:dange] = "You are not allowd to do that"
		end
	end

	def show
		@main_page = find_page
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
