class DropLocas < ActiveRecord::Migration[5.2]
  def change
    drop_table :locas
  end
end
