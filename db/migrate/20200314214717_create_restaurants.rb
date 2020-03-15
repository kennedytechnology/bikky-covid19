class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :url
      t.string :location
      t.text :description
      t.float :longitude
      t.float :latitude
      t.text :address

      t.timestamps
    end
  end
end
