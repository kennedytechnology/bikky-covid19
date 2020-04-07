class AddCurrentlyOpenToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :currently_open, :boolean, default: true
  end
end
