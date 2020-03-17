class CreateJoinTableGuidesRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_join_table :guides, :restaurants do |t|
      # t.index [:guide_id, :restaurant_id]
      # t.index [:restaurant_id, :guide_id]
    end
  end
end
