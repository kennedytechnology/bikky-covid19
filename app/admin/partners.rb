ActiveAdmin.register Partner do
  menu priority: 2

  active_admin_import on_duplicate_key_update: :all,
    before_batch_import: ->(importer) {  
    }

  permit_params :brand, :mood, :daypart_1, :daypart_2, :meal_size_1, :meal_size_2, :price, :deal, :picture, guide_ids: []
                

  # Index
  index download_links: [:csv] do
    selectable_column
    id_column
    column "Photo", :photo do |partner|
      link_to image_tag(url_for(partner.picture.variant(resize_to_limit: [100,100]))) , admin_partner_path(partner) if partner.picture.attached?
    end
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

  # Filters
  filter :brand, as: :select, collection: proc { Partner.all.order('brand').collect{|partner| partner.brand}.uniq }
  filter :mood, as: :select, collection: proc { Partner.all.order('mood').collect{|partner| partner.mood}.uniq.compact }
  filter :daypart_1, as: :select, collection: proc { Partner.all.order('daypart_1').collect{|partner| partner.daypart_1}.uniq.compact }
  filter :daypart_2, as: :select, collection: proc { Partner.all.order('daypart_2').collect{|partner| partner.daypart_2}.uniq.compact }
  filter :meal_size_1, as: :select, collection: proc { Partner.all.order('meal_size_1').collect{|partner| partner.meal_size_1}.uniq.compact }
  filter :meal_size_2, as: :select, collection: proc { Partner.all.order('meal_size_2').collect{|partner| partner.meal_size_2}.uniq.compact }
  filter :price, as: :select, collection: {'$' => 1, '$$' => 2, '$$$' => 3, '$$$$' => 4, '$$$$$' => 5}

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
      row :picture do |partner|
        image_tag(url_for(partner.picture.variant(resize_to_limit: [500,500]))) if partner.picture.attached?
      end
    end

    

    active_admin_comments
  end

  # Form
  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :brand
      f.input :mood
      f.input :daypart_1
      f.input :daypart_2
      f.input :meal_size_1
      f.input :meal_size_2
      f.input :deal
      f.input :price, as: :select, collection: {'$' => 1, '$$' => 2, '$$$' => 3, '$$$$' => 4, '$$$$$' => 5}
    end
    f.input :guide_ids, as: :check_boxes, collection: Guide.all
      if f.object.picture.attached?
        f.input :picture, as: :file, hint: image_tag(f.object.picture.variant(resize: "500x500"))
      else
        f.input :picture, as: :file
      end
    f.actions 
  end
end
