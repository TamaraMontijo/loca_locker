class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home
  skip_after_action :verify_authorized, only: :home

  def home
    @lockers = policy_scope(Locker).order(created_at: :desc)
  end

  def my_bookings
    @bookings = current_user.bookings #policy_scope(Booking)
    authorize @bookings
  end

  def my_lockers
    @lockers = current_user.lockers
    authorize @lockers
  end

  def profile
    @user = current_user
    authorize @user
  end
end
