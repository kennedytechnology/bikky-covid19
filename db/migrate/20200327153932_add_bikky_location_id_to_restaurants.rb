class AddBikkyLocationIdToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :bikky_location_id, :bigint
  end
end
