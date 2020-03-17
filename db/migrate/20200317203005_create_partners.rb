class CreatePartners < ActiveRecord::Migration[6.0]
  def change
    create_table :partners do |t|
      t.string :brand
      t.string :status
      t.string :mood
      t.string :daypart_1
      t.string :daypart_2
      t.string :meal_size_1
      t.string :meal_size_2
      t.integer :price
      t.string :deal

      t.timestamps
    end
  end
end
