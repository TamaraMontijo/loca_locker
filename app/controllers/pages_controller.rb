class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home, :index]

  def home
  end

  def my_bookings
    @bookings = current_user.bookings #policy_scope(Booking)
    authorize @bookings
  end

  def my_lockers
    @lockers = current_user.lockers
    authorize @lockers
  end
end
