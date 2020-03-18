class CreateJoinTableGuidesPartners < ActiveRecord::Migration[6.0]
  def change
    create_join_table :guides, :partners do |t|
      # t.index [:guide_id, :partner_id]
      # t.index [:partner_id, :guide_id]
    end
  end
end
