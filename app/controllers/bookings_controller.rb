  class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def show
    @booking = Booking.find(booking_params)
    authorize @booking
  end

  def edit
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def update
    authorize @booking
    @booking.update(restaurant_params)

    redirect_to @bookings
  end

  def destroy
    @booking = Booking.where(user_id: current_user.id).first
    authorize @booking
    @booking.destroy
    redirect_to my_bookings_destroy_path
  end

 def create
    @booking = Booking.new(booking_params)

    @locker = Locker.find(params[:locker_id])
    @booking.locker = @locker
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to my_bookings_path, notice: 'Booking was successfully created.'
    else
      render 'lockers/show'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :start_time, :end_time, :locker_id)
  end
end
