class LockersController < ApplicationController

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

    if @locker.save # => false / true
      redirect_to @locker, notice: 'Locker was successfully created.'
    else
      render :new
    end
  end

    def update
    if @locker.update(locker_params) # true / false
      redirect_to @locker, notice: 'Locker was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @locker.destroy
    redirect_to lockers_url, notice: 'Locker was successfully deleted.'
  end

  private

  def set_locker
    @locker = Locker.find(params[:id])
  end

  def locker_params
    params.require(:locker).permit(:size, :address, :price)
  end
end
