class CreateMealSize2s < ActiveRecord::Migration[6.0]
  def change
    create_table :meal_size2s do |t|
      t.string :name

      t.timestamps
    end
  end
end
