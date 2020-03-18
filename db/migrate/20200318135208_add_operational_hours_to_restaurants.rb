class AddOperationalHoursToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :mon_open, :string
    add_column :restaurants, :mon_close, :string
    add_column :restaurants, :tue_open, :string
    add_column :restaurants, :tue_close, :string
    add_column :restaurants, :wed_open, :string
    add_column :restaurants, :wed_close, :string
    add_column :restaurants, :thur_open, :string
    add_column :restaurants, :thur_close, :string
    add_column :restaurants, :fri_open, :string
    add_column :restaurants, :fri_close, :string
    add_column :restaurants, :sat_open, :string
    add_column :restaurants, :sat_close, :string
    add_column :restaurants, :sun_open, :string
    add_column :restaurants, :sun_close, :string
  end
end
