
class CreateRentals < ActiveRecord::Migration[7.0]
  def change
    create_table :rentals do |t|
      t.integer :bike_id, null: false
      t.integer :start_station_id, null: false
      t.integer :end_station_id, null: false
      t.integer :user_id, null: false
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
