ActiveAdmin.register Picture do

  menu false
  permit_params :category, :image, :partner_id

  index do
    selectable_column
    id_column
    # column :category
    column :image do |picture|
      image_tag url_for(picture.thumb) if picture.image.attached?
    end
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :category
      row :image do |picture|
        image_tag url_for(picture.image) if picture.image.attached?
      end

    end
  end

  form do |f|
    f.semantic_errors
    f.input :category, as: :hidden
    f.input :partner, as: :hidden
    f.input :image, as: :file
    f.actions 
  end
  
end
