class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.string :name
      t.string :ssid
      t.string :pw
      t.integer :dl
      t.integer :ul
      t.string :address
      t.string :website
      t.string :yelp
      t.string :google

      t.timestamps
    end
  end
end
