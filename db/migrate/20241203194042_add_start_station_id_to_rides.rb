class AddStartStationIdToRides < ActiveRecord::Migration[7.0]
  def change
    add_column :rides, :start_station_id, :integer
  end
end
