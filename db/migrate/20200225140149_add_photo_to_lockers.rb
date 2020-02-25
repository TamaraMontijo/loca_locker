class AddPhotoToLockers < ActiveRecord::Migration[5.2]
  def change
    add_column :lockers, :photo, :string
  end
end
