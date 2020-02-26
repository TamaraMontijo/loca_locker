  class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(booking_params)
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking.update(restaurant_params)

    redirect_to @bookings
  end

  def destroy
    booking = Booking.find(params[:id])
    booking.destroy
  end

 def create
    @booking = Booking.new(booking_params)

    @locker = Locker.find(params[:locker_id])
    @booking.locker = @locker
    @booking.user = current_user

    if @booking.save
      redirect_to "/lockers/:locker_id/bookings", notice: 'Booking was successfully created.'
    else
      render 'lockers/show'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :locker_id)
  end
end
