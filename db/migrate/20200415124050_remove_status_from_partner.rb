class RemoveStatusFromPartner < ActiveRecord::Migration[6.0]
  def change

    remove_column :partners, :status, :string
  end
end
