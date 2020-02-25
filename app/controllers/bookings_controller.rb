class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking
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
    @booking = Booking.new(booking_params)
    @locker = Locker.find(params[:user_id])
    @booking.locker = @locker

    if @booking.save
      redirect_to @locker
    else
      render 'lockers/show'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id)
  end
end
