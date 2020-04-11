ActiveAdmin.register Restaurant do
  menu priority: 1

  permit_params :name, :address, :longitude, :latitude, :partner_id, :url, :currently_open,
                :mon_open, :mon_close, :tue_open, :tue_close, :wed_open,
                :wed_close, :thur_open, :thur_close, :fri_open, :fri_close,
                :sat_open, :sat_close, :sun_open, :sun_close, :phone_number

  # Index
  index download_links: [:csv] do
    selectable_column
    id_column
    column "Photo", :photo do |restaurant|
      link_to image_tag(url_for(restaurant.partner.picture.variant(resize_to_limit: [100,100]))) , admin_partner_path(restaurant.partner) if restaurant.partner.picture.attached?
    end
    column "Location", :name do |restaurant|
      restaurant.name
    end
    column :address
    column "Brand", :partner do |restaurant|
      link_to(restaurant.partner.brand, admin_partner_path(restaurant.partner))
    end

    actions
  end

  # Filters
  filter :partner, label: "Brand", as: :select, collection: proc { Partner.all.order('brand').collect{|partner| partner.brand}.uniq}
  filter :location
  filter :address

  # Show
  show do |restaurant|
    attributes_table do
      row :name
      row "URL", :url do 
        link_to restaurant.url, restaurant.url, target: "_blank"
      end
      row :address
      row :latitude
      row :longitude
      row :phone_number
      row :created_at
      row :updated_at
      row "Brand", :partner do 
        link_to(restaurant.partner.brand, admin_partner_path(restaurant.partner))
      end
    end

    panel "Working Hours" do
      table_for restaurant do

        column do
          columns "Open:"
          columns "Close:"
        end
        column "Monday" do
          columns do
            restaurant.mon_open
          end
          columns do
            restaurant.mon_close
          end
        end
        column "Tuesday" do
          columns do
            restaurant.tue_open
          end
          columns do
            restaurant.tue_close
          end
        end
        column "Wednesday" do
          columns do
            restaurant.wed_open
          end
          columns do
            restaurant.wed_close
          end
        end
        column "Thursday" do
          columns do
            restaurant.thur_open
          end
          columns do
            restaurant.thur_close
          end
        end
        column "Friday" do
          columns do
            restaurant.fri_open
          end
          columns do
            restaurant.fri_close
          end
        end
        column "Saturday" do
          columns do
            restaurant.sat_open
          end
          columns do
            restaurant.sat_close
          end
        end
        column "Sunday" do
          columns do
            restaurant.sun_open
          end
          columns do
            restaurant.sun_close
          end
        end

      end
    end

    active_admin_comments
  end

  # Form
  form do |f|
    f.semantic_errors *f.object.errors.keys

    tabs do
      tab "General Information" do
        f.inputs do
          f.input :partner_id, label: "Choose Brand", as: :select, collection: Partner.all.order('brand').collect{|p| [ p.brand, p.id ] }
          f.input :name, as: :string
          f.input :url, label: "URL"
          f.input :phone_number
          f.input :address, as: :string
          f.input :latitude
          f.input :longitude
          f.input :currently_open
        end
      end

      tab "Working Hours" do
        f.inputs "Monday" do
          columns do
            column { f.input :mon_open, label: "Opens", as: :time_picker }
            column { f.input :mon_close, label: "Closes", as: :time_picker }
          end
        end
        f.inputs "Tuesday" do
          columns do
            column { f.input :tue_open, label: "Opens", as: :time_picker }
            column { f.input :tue_close, label: "Closes", as: :time_picker }
          end
        end
        f.inputs "Wednesday" do
          columns do
            column { f.input :wed_open, label: "Opens", as: :time_picker }
            column { f.input :wed_close, label: "Closes", as: :time_picker }
          end
        end
        f.inputs "Thursday" do
          columns do
            column { f.input :thur_open, label: "Opens", as: :time_picker }
            column { f.input :thur_close, label: "Closes", as: :time_picker }
          end
        end
        f.inputs "Friday" do
          columns do
            column { f.input :fri_open, label: "Opens", as: :time_picker }
            column { f.input :fri_close, label: "Closes", as: :time_picker }
          end
        end
        f.inputs "Saturday" do
          columns do
            column { f.input :sat_open, label: "Opens", as: :time_picker }
            column { f.input :sat_close, label: "Closes", as: :time_picker }
          end
        end
        f.inputs "Sunday" do
          columns do
            column { f.input :sun_open, label: "Opens", as: :time_picker }
            column { f.input :sun_close, label: "Closes", as: :time_picker }
          end
        end
      end
    end

    f.actions
  end
  
end
