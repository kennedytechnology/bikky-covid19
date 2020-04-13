ActiveAdmin.register Restaurant do
  menu priority: 1

  before_create do |restaurant|
    restaurant.mon_open = restaurant.weekday_open
    restaurant.mon_close = restaurant.weekday_close
    restaurant.tue_open = restaurant.weekday_open
    restaurant.tue_close = restaurant.weekday_close
    restaurant.wed_open = restaurant.weekday_open
    restaurant.wed_close = restaurant.weekday_close
    restaurant.thur_open = restaurant.weekday_open
    restaurant.thur_close = restaurant.weekday_close
    restaurant.fri_open = restaurant.weekday_open
    restaurant.fri_close = restaurant.weekday_close
    restaurant.sat_open = restaurant.weekend_open
    restaurant.sat_close = restaurant.weekend_close
    restaurant.sun_open = restaurant.weekend_open
    restaurant.sun_close = restaurant.weekend_close
  end
  
  active_admin_import on_duplicate_key_update: :all,
    headers_rewrites: { 'Partner': :partner_id },
    before_batch_import: ->(importer) {
      partner_names = importer.values_at(:partner_id).uniq
      partners = Partner.where(brand: partner_names).pluck(:brand, :id)
      replacements = Hash[*partners.flatten]      
      column_index = importer.headers.values.index(:partner_id)
      importer.csv_lines.each do |line|
        line[column_index] = replacements[line[column_index]]
      end      
    }

  permit_params :name, :address, :longitude, :latitude, :partner_id, :url,
                :mon_open, :mon_close, :tue_open, :tue_close, :wed_open,
                :wed_close, :thur_open, :thur_close, :fri_open, :fri_close,
                :sat_open, :sat_close, :sun_open, :sun_close, :is_published,
                :currently_open, :phone_number, :weekday_open, :weekday_close,
                :weekend_open, :weekend_close

  batch_action :publish do |ids|
    batch_action_collection.find(ids).each do |restaurant|
      restaurant.is_published = true
      restaurant.save
    end
    redirect_to collection_path, alert: "The selected restaurants were published"
  end

  batch_action :unpublish do |ids|
    batch_action_collection.find(ids).each do |restaurant|
      restaurant.is_published = false
      restaurant.save
    end
    redirect_to collection_path, alert: "The selected restaurants were un-published"
  end

  csv do
    column :id
    column("bikky_location_id", humanize_name: false) 
    column(:partner) {|restaurant| restaurant.partner.name}
    column :description
    column :name
    column :url
    column :location
    column :address
    column :currently_open
    column :mon_open
    column :mon_close
    column :tue_open
    column :tue_close
    column :wed_open
    column :wed_close
    column :thur_open
    column :thur_close
    column :fri_open
    column :fri_close
    column :sat_open
    column :sat_close
    column :sun_open
    column :sun_close
  end

  # Index
  index download_links: [:csv] do
    selectable_column
    id_column
    column "Photo", :photo do |restaurant|
      link_to image_tag(url_for(restaurant.partner.picture.variant(resize_to_limit: [100,100]))) , admin_partner_path(restaurant.partner) if restaurant.partner.picture.attached?
    end
    column :is_published
    column :currently_open
    # column "Is Published", :is_published do |restaurant|
    #   restaurant.name
    # end
    column :address
    column "Brand", :partner do |restaurant|
      link_to(restaurant.partner.brand, admin_partner_path(restaurant.partner))
    end

    actions
  end

  # Filters
  filter :partner, label: "Brand", as: :select, collection: proc {Partner.all.order('brand').uniq.collect{|partner| [partner.brand, partner.id]}}
  filter :location
  filter :address
  filter :is_published, as: :boolean

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
          f.input :partner_id, label: "Choose Brand", as: :select, collection: Partner.all.order('brand').collect{|p| [ p.brand, p.id ] }, include_blank: false
          f.input :name, as: :string
          f.input :url, label: "URL"
          f.input :phone_number
          f.input :address, as: :string
          f.input :latitude
          f.input :longitude
          f.input :currently_open
          f.input :is_published
          if f.object.new_record?
            f.inputs "Weekdays" do
              columns do
                column { f.input :weekday_open, label: "Opens", as: :time_picker }
                column { f.input :weekday_close, label: "Closes", as: :time_picker }
              end
            end
            f.inputs "Weekends" do
              columns do
                column { f.input :weekend_open, label: "Opens", as: :time_picker }
                column { f.input :weekend_close, label: "Closes", as: :time_picker }
              end
            end
          end
        end
      end
      unless f.object.new_record?
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
    end

    f.actions
  end
  
end
