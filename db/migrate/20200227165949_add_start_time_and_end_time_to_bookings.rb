class AddStartTimeAndEndTimeToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :start_time, :string
    add_column :bookings, :end_time, :string
  end
end
