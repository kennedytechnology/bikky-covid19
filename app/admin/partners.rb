ActiveAdmin.register Partner do
  menu priority: 2

  permit_params :brand, :mood, :daypart_1, :daypart_2, :meal_size_1, :meal_size_2, :price, guide_ids: []

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
    end

    

    active_admin_comments
  end

  form do |f|
    f.semantic_errors
    f.inputs
    f.input :guide_ids, as: :check_boxes, collection: Guide.all
    f.actions 
  end
end
