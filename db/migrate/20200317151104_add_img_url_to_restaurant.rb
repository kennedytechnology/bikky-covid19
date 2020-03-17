class AddImgUrlToRestaurant < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :img_url, :string
  end
end
