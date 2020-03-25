ActiveAdmin.register Guide do
  menu priority: 3

  permit_params :name

  index do
    selectable_column
    id_column
    column :name
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :name
      row :created_at
      row :updated_at
      row "Restaurants" do |guide|
        guide.partners.each do |p|
          div do
            link_to p.brand, admin_partner_path(p)
          end
        end
      end
    end
  end
end
