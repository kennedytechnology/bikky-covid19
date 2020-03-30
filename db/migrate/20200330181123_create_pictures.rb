class CreatePictures < ActiveRecord::Migration[6.0]
  def change
    create_table :pictures do |t|
      t.string :category
      t.belongs_to :partner

      t.timestamps
    end
  end
end
