class CreatePictures < ActiveRecord::Migration[6.0]
  def change
    create_table :pictures do |t|
      t.string :category
      t.references :pictureable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
