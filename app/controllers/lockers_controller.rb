class LockersController < ApplicationController
  def index
    @lockers = Locker.all
  end

  def show
    @locker = Locker.find(params[:id])
  end
end
