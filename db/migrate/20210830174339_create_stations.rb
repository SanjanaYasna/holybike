class CreateStations < ActiveRecord::Migration[6.1]
  def change
    create_table :stations do |t|
      t.integer :identifier
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end
