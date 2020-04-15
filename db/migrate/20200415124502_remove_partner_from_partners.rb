class RemovePartnerFromPartners < ActiveRecord::Migration[6.0]
  def change

    remove_column :partners, :partner, :string
  end
end
