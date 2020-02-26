class LockersController < ApplicationController
  before_action :set_locker, only: [:show, :edit, :update, :destroy]

  def index
    @lockers = policy_scope(Locker).order(created_at: :desc)
  end

  def show
    @locker = Locker.find(params[:id])
    @booking = Booking.new
    authorize @locker
  end

  def new
    @locker = current_user.lockers.new
    authorize @locker
  end

  def create
    @locker = current_user.lockers.new(locker_params)
    @locker.photo = @locker.get_photo
    @locker.user = current_user
    authorize @locker
    if @locker.save # => false / true
      redirect_to lockers_path, notice: 'Locker was successfully created.'
    else
      render :new
      puts @locker.errors.messages
    end
  end

  def edit
    authorize @locker
  end

  def update
    authorize @locker
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
