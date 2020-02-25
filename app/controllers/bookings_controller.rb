class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def edit
    @booking = Booking.find(params[:id])
  end

   def update
    @booking.update(restaurant_params)

    redirect_to @booking
  end

  def destroy
    booking = Booking.find(params[:id])
    booking.destroy
  end

 def create
    @locker = Locker.find(params[:locker_id])
    @booking = Booking.new(booking_params)
    @booking.locker = @locker

    if @booking.save
      redirect_to @bookings
    else
      render 'lockers/show'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :locker_id)
  end
end
