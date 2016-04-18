class HotelsController < ApplicationController

	#for can can
	load_and_authorize_resource

  def index
    @hotels = Hotel.all
		@standard = Standard.all
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
		@standard = Standard.all
		war1 = ""
		war2 = ""
		war3 = ""
		if !(params[:hotel][:standard] == "")
			war1 = "standard = (#{params[:hotel][:standard].to_i})"
		end
		if !(params[:hotel][:city] == "")
			war2 = "LOWER(city) LIKE LOWER('%#{params[:hotel][:city]}%')"
		end
		if !(params[:hotel][:name] == "")
			war3 = "LOWER(name) LIKE LOWER('%#{params[:hotel][:name]}%')"
		end
		puts params[:hotel][:name]
		@hotels = Hotel.where(war1).where(war2).where(war3)
	end
  
	private

	def hotel_params
		params.require(:hotel).permit(:name, :city, :address, :description, :link, :standard, :phone, :email, :picture)
	end

	def find_hotel
		Hotel.find(params[:id])
	end
	
end
