class CreateDaypart2s < ActiveRecord::Migration[6.0]
  def change
    create_table :daypart2s do |t|
      t.string :name

      t.timestamps
    end
  end
end
