class BookingsController < ApplicationController

before_filter :authenticate_user!

def new
	@booking = Booking.new
end

def create
	@booking = current_reservation.booking.create(booking_params)
	if @booking.save
		flash[:alert] = "You have now booked a date"
		redirect_to root_path
	else
		flash[:alert] = "Error:booking did not save"
		redirect_to root_path
		render 'new'
	end
end


def show
	@booking = Booking.find(params[:id])
end

def edit
	@booking = Booking.find(params[:id])

	unless @booking.user == current_user
		redirect_to root_path
	end
end

def update 
	@booking = Booking.find(params[:id])
	unless @booking.user == current_user
		redirect_to root_path
	end

	if @booking.update_attributes(booking_params)	
		redirect_to root_path
		flash[:notice] = "You have edited your post"
	else
		render 'edit'
		flash[:alert] = "something went wrong"
	end
end

def destroy 
	@booking = Booking.find(params[:id])
	@booking.destroy
	redirect_to root_path
end	

private
def booking_params
	params.require(:booking).permit(:content)
end

end