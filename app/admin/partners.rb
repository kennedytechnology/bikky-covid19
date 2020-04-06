ActiveAdmin.register Partner do
  menu priority: 2

  permit_params :brand, :mood, :daypart_1, :daypart_2, :meal_size_1, :meal_size_2, :price, :picture, guide_ids: [],
                picture_attributes: [:id, :_destroy, :category, :image]

  index download_links: [:csv] do
    selectable_column
    id_column
    column :brand
    column :mood
    column :daypart_1
    column :daypart_2
    column :meal_size_1
    column :meal_size_2
    column "Price", :price do |partner|
      "$" * partner.price
    end

    actions
  end

  show do
    attributes_table do
      row :brand
      row :mood
      row :daypart_1
      row :daypart_2
      row :meal_size_1
      row :meal_size_2
      row :deal
      row "Price", :price do |partner|
        "$" * partner.price
      end

      row :created_at
      row :updated_at

      row :restaurants

      row "Restaurants Total" do |partner|
        partner.restaurants.count
      end

      row :guides

      row "Picture" do |partner|
        if partner.picture.attached?
          image_tag partner.picture.variant(resize_to_limit: [500, 500])
        else
          "No picture provided yet"
        end
      end
    end

    

    active_admin_comments
  end

  form do |f|
    f.semantic_errors
    f.inputs
    f.input :guide_ids, as: :check_boxes, collection: Guide.all

    if f.object.picture.attached?
      f.input :picture, label: "Upload New Picture", 
              as: :file, hint: image_tag(f.object.picture.variant(resize: "500x500"))

      f.semantic_fields_for :picture_attributes do |picture_fields|
        picture_fields.input :_destroy, as: :boolean, label: 'Delete Picture?'
      end
    else 
      f.input :picture, label: "Upload Picture", as: :file
    end
    f.actions 
  end
end
