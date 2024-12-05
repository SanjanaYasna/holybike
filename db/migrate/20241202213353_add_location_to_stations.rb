class AddLocationToStations < ActiveRecord::Migration[7.0]
  def change
    add_column :stations, :latitude, :float
    add_column :stations, :longitude, :float
  end
end
