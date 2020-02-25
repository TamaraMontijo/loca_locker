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
    @locker= Locker.new(locker_params)

  if @locker.save # => false / true
    redirect_to @locker, notice: 'Locker was successfully created.'
  else
      render :new
    end
  end

  # def delete
  #   @locker.delete
  # end

  private

  def locker_params
    params.require(:locker).permit(:size, :price, :address)
end

end
