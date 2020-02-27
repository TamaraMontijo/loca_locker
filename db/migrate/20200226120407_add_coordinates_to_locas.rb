class AddCoordinatesToLocas < ActiveRecord::Migration[5.2]
  def change
    add_column :locas, :latitude, :float
    add_column :locas, :longitude, :float
  end
end
