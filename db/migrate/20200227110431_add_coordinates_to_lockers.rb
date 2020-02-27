class AddCoordinatesToLockers < ActiveRecord::Migration[5.2]
  def change
    add_column :lockers, :latitude, :float
    add_column :lockers, :longitude, :float
  end
end
