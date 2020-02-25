class AddColumnsToBookings < ActiveRecord::Migration[5.2]
  def change
    add_reference :bookings, :locker, foreign_key: true
    add_reference :bookings, :user, foreign_key: true
    add_column :bookings, :start_date, :date
    add_column :bookings, :end_date, :date
  end
end
