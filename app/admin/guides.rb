ActiveAdmin.register Guide do
  menu priority: 3

  permit_params :name, partner_ids: []

  # Index
  index download_links: [:csv]  do
    selectable_column
    id_column
    column :name
    column "Brands", :partners
    column :created_at
    column :updated_at
    actions
  end

  # Filters
  filter :name, as: :select, collection: proc { Guide.all.order('name').collect{|guide| guide.name}.uniq}
  filter :partners, label: "Brands", as: :select, collection: proc { Partner.all.order('brand').collect{|partner| partner.brand}.uniq }

  # Show
  show do
    attributes_table do
      row :name
      row :created_at
      row :updated_at
      row :partners
    end
  end

  # Form
  form do |f|
    f.input :name
    f.input :partner_ids, as: :check_boxes, collection: Partner.all
  end

end
