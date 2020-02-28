class LockersController < ApplicationController
  before_action :set_locker, only: [ :edit, :update, :destroy]

  def index
    #@lockers = Locker.geocoded

    if params[:search].present? && params[:search][:query].present?
      @lockers = policy_scope(Locker).where("address ILIKE '%#{params[:search][:query]}%'").geocoded
    else
      @lockers = policy_scope(Locker).order(created_at: :desc).geocoded
    end

    @markers = @lockers.map do |locker|
      {
        lat: locker.latitude,
        lng: locker.longitude
      }
    end
  end

  def show
    @locker = Locker.geocoded.find(params[:id])
    authorize @locker
    @booking = Booking.new
    @markers =
      {
        lat: @locker.latitude,
        lng: @locker.longitude
      }
  end

  def new
    @locker = current_user.lockers.new
    authorize @locker
  end

  def create
    @locker = current_user.lockers.new(locker_params)
    @locker.photo = @locker.get_photo
    @locker.user_id = current_user.id
    authorize @locker
    if @locker.save # => false / true
      redirect_to lockers_path, notice: 'Locker was successfully created!'
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
      @locker.photo = @locker.get_photo
      @locker.save
      redirect_to locker_path(@locker)
    else
      puts @locker.errors.messages
      render :edit
    end
  end

  def destroy
    authorize @locker
    if @locker.destroy
      redirect_to my_lockers_path, notice: "Locker was successfully destroyed"
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
#quasre
