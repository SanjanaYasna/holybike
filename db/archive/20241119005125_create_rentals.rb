class CreateRentals < ActiveRecord::Migration[7.0]
  def change
    create_table :rentals do |t|
      #rentals is logged iwth user
      t.integer :user_id, null: false
      #TODO change below to false and require this info
      t.datetime :start_time #, null: false
      t.datetime :end_time# , null: false
      t.integer :cost #, null: false
      t.timestamps
    end
  end
end