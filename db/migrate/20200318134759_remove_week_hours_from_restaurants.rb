class RemoveWeekHoursFromRestaurants < ActiveRecord::Migration[6.0]
  def change

    remove_column :restaurants, :weekday_open, :string

    remove_column :restaurants, :weekday_close, :string

    remove_column :restaurants, :weekend_open, :string

    remove_column :restaurants, :weekend_close, :string
  end
end
