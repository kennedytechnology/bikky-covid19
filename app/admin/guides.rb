ActiveAdmin.register Guide do
  menu priority: 3

  permit_params :name, partner_ids: []

  index download_links: [:csv]  do
    selectable_column
    id_column
    column :name
    column :partners
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :name
      row :created_at
      row :updated_at
      row :partners
    end
  end

  form do |f|
    f.input :name
    f.input :partner_ids, as: :check_boxes, collection: Partner.all
  end

end
