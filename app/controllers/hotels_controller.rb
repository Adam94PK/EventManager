class HotelsController < ApplicationController

	def new
		@hotel = Hotel.new
	end

	def create
	  @hotel = current_user.hotels.build(hotel_params)
	  if @hotel.save
	  	redirect_to @hotel
	  else
	  	flash.now[:danger] = 'Wrong input data'
  		render :new
  	  end
	end

	def edit
		@hotel = find_hotel
	end

	def update
	  @hotel = find_hotel
	  if @hotel.update(hotel_params)
	  	redirect_to @hotel
	  else
	  	flash.now[:danger] = 'Wrong input data'
	  	render :new
	  end
	end

	def show
	  @hotel = find_hotel
	end

	def destroy
	  @hotel = find_hotel
	  @hotel.destroy
	  redirect_to root_path
	end

	private

	def hotel_params
		params.require(:hotel).permit(:name, :city, :address, :description, :link, :standard, :phone, :email, :picture)
	end

	def find_hotel
		Hotel.find(params[:id])
	end
end
