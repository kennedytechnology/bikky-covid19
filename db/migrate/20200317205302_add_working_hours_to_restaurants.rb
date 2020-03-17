class AddWorkingHoursToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :weekday_open, :string
    add_column :restaurants, :weekday_close, :string
    add_column :restaurants, :weekend_open, :string
    add_column :restaurants, :weekend_close, :string
  end
end
