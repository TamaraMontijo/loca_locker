class LockersController < ApplicationController
  before_action :set_locker, only: [:show, :edit, :update, :destroy]

  def index
    @lockers = Locker.all
  end

  def show
    @locker = Locker.find(params[:id])
  end

  def new
    @locker = Locker.new
  end

  def create
    @locker = Locker.new(locker_params)
    if @locker.save
      redirect_to locker_path
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

  private

  def locker_params
    params.require(:locker).permit(:size, :address, :price)
  end

  def set_locker
    @locker = Locker.find(params[:id])
  end
end