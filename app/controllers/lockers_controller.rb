class LockersController < ApplicationController
  before_action :set_locker, only: [ :edit, :update, :destroy]

  def index
    @lockers = Locker.all
  end

  def show
    @locker = Locker.geocoded.find(params[:id])
   @booking = Booking.new
    @markers =
      {
        lat: @locker.latitude,
        lng: @locker.longitude
      }
  end

  def new
    @locker = Locker.new
  end

  def create
    @locker= Locker.new(locker_params)
    @locker.photo = @locker.get_photo
    @locker.user_id = current_user.id
    if @locker.save # => false / true
      redirect_to lockers_path, notice: 'Locker was successfully created!'
    else
      render :new
      puts @locker.errors.messages
    end
  end

  def edit
  end

  def update
    if @locker.update(locker_params)
      redirect_to locker_path(@locker)
    else
      puts @locker.errors.messages
    end
  end

  def destroy
    if @locker.destroy
      redirect_to locker_path, notice: "Flat was successfully destroyed"
    else
      puts @locker.errors.messages
    end
  end

  private

  def locker_params
    params.require(:locker).permit(:size, :price, :address, :photo)
end

  def set_locker
    @locker = Locker.find(params[:id])
  end
end
