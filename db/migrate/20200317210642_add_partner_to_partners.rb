class AddPartnerToPartners < ActiveRecord::Migration[6.0]
  def change
    add_column :partners, :partner, :string
  end
end
