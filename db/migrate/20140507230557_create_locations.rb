class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :address
      t.string :street_name
      t.string :block_number
      t.string :postal_code
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
