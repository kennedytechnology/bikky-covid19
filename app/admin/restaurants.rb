ActiveAdmin.register Restaurant do

  menu priority: 1
  permit_params :name, :url, :location, :description, :address

  index do
    selectable_column
    id_column
    column :name
    column :url
    column :location
    column :description
    column :latitude
    column :longitude
    column :address
    column :created_at
    column :updated_at
    actions
  end

  show do |restaurant|

    attributes_table do
      row :name
      row :url
      row :location
      row :description
      row :address
      row :latitude
      row :longitude
      row :created_at
      row :updated_at
    
    end    
    
    active_admin_comments
  end
  
  form do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs do
      f.input :name, as: :string
      f.input :url, as: :string
      f.input :location, as: :string
      f.input :address, as: :string 
      f.input :description           
    end
    f.actions
  end
end
