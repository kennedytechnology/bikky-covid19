class AddPartnerToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_reference :restaurants, :partner, foreign_key: true
  end
end
