class CreateRentals < ActiveRecord::Migration[7.0]
  def change
    create_table :rentals do |t|
      t.integer :user_id, null: false
      t.references :ride, null: false, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time
      t.integer :cost #, null: false
      t.timestamps
    end
  end
end