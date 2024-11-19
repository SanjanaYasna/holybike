class AddPriceToRides < ActiveRecord::Migration[7.0]
  def change
    add_column :rides, :price, :integer
  end
end
