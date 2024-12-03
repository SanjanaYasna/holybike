class AddEndStationIdToRides < ActiveRecord::Migration[7.0]
  def change
    add_column :rides, :end_station_id, :integer
  end
end
