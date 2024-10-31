class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.integer :identifier
      t.string :fname
      t.string :lname
      t.string :email 
      t.string :phone
      t.string :pword
      t.integer :bike_id
      t.integer :station_id
      t.integer :ride_id
      t.integer :broken_report_id
      t.integer :review_id
      t.integer :rental_id
      t.timestamps
    end
  end
end
