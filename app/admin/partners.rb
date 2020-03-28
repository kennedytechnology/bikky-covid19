ActiveAdmin.register Partner do
  menu priority: 2

  permit_params :brand, :mood, :daypart_1, :daypart_2, :meal_size_1, :meal_size_2, :price, guide_ids: []

  # Index
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
      "$" * partner.price.to_i
    end

    actions
  end

  # Filters
  filter :brand, as: :select, collection: proc { Partner.all.collect{|partner| partner.brand}.uniq.sort }
  filter :mood, as: :select, collection: proc { Partner.all.collect{|partner| partner.mood}.uniq.compact.sort }
  filter :daypart_1, as: :select, collection: proc { Partner.all.collect{|partner| partner.daypart_1}.uniq.compact }
  filter :daypart_2, as: :select, collection: proc { Partner.all.collect{|partner| partner.daypart_2}.uniq.compact }
  filter :meal_size_1, as: :select, collection: proc { Partner.all.collect{|partner| partner.meal_size_1}.uniq.compact }
  filter :meal_size_2, as: :select, collection: proc { Partner.all.collect{|partner| partner.meal_size_2}.uniq.compact }
  filter :price, as: :select, collection: { '$' => 1, '$$' => 2, '$$$' => 3, '$$$$' => 4, '$$$$$' => 5 }

  # Show
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

  # Form
  form do |f|
    f.semantic_errors
    f.inputs
    f.input :guide_ids, as: :check_boxes, collection: Guide.all
    f.actions 
  end
end
