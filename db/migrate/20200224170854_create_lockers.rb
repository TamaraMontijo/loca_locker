class CreateLockers < ActiveRecord::Migration[5.2]
  def change
    create_table :lockers do |t|
      t.string :size
      t.integer :price
      t.string :address
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
