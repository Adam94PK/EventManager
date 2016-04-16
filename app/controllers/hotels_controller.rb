class HotelsController < ApplicationController

	#for can can
	load_and_authorize_resource

  def index
    @hotels = Hotel.all
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

	def new
		@hotel = Hotel.new
	end

	def edit
		@hotel = find_hotel
	end

  def show
    @hotel = find_hotel
	end

	def update
	  @hotel = find_hotel
	  if @hotel.update(hotel_params)
	  	redirect_to @hotel
	  else
	  	flash.now[:danger] = 'Wrong input data'
	  	render :edit
	  end
	end

  def destroy
    @hotel = find_hotel
    @hotel.destroy
    redirect_to root_path
  end

  def show_followed
	  if current_user.present?
    	@hotels = current_user.hotels
    end
  end
  
  def search
  	@hotels = Hotel.where("LOWER(name) LIKE LOWER('%#{params[:hotel][:name]}%')")
  end

	private

	def hotel_params
		params.require(:hotel).permit(:name, :city, :address, :description, :link, :standard, :phone, :email, :picture)
	end

	def find_hotel
		Hotel.find(params[:id])
	end
	
end
