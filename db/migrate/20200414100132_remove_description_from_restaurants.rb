class RemoveDescriptionFromRestaurants < ActiveRecord::Migration[6.0]
  def change

    remove_column :restaurants, :description, :text
  end
end
