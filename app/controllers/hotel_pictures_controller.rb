class HotelPicturesController < ApplicationController

	#for can can
	load_and_authorize_resource

	def create
		@hotel = find_hotel
		@hotel_picture = @hotel.hotel_pictures.create(hotel_picture_params)
		redirect_to @hotel
	end			

	def destroy
	  @hotel = find_hotel
	  @hotel_picture = @hotel.hotel_pictures.find(params[:id])
	  @hotel_picture.destroy
	  redirect_to @hotel
	end

	private

	def hotel_picture_params
		params.require(:hotel_picture).permit(:picture)
	end

	def find_hotel
		Hotel.find(params[:hotel_id])
	end
end