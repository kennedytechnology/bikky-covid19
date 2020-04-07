ActiveAdmin.register Restaurant do
  menu priority: 1

  permit_params :name, :address, :longitude, :latitude, :partner_id, :url

  action_item :only => :index do
    link_to 'Upload CSV', :action => 'upload_csv'
  end

  collection_action :upload_csv do
    render "admin/csv/upload_csv"
  end

  collection_action :import_csv, :method => :post do
    CsvDb.convert_save("restaurant", params[:dump][:file])
    redirect_to :action => :index, :notice => "CSV imported successfully!"
  end

  # Index
  index download_links: [:csv] do
    selectable_column
    id_column
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
  filter :partner
  filter :name
  filter :address

  # Show
  show do |restaurant|
    attributes_table do
      row :name
      row :url
      row :address
      row :latitude
      row :longitude
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

  # Edit
  form do |f|
    f.semantic_errors *f.object.errors.keys

    tabs do
      tab "General Information" do
        f.inputs do
          f.input :partner_id, label: "Choose Brand", as: :select, collection: Partner.all.collect {|p| [ p.brand, p.id ] }
          f.input :name, as: :string
          f.input :url, label: "URL"
          f.input :longitude
          f.input :latitude
          f.input :address, as: :string
        end
      end

      tab "Working Hours" do
        f.inputs do
          f.input :mon_open, label: "Monday Opens at", as: :time_picker
          f.input :mon_close, label: "Monday Closes at", as: :time_picker
          f.input :tue_open, label: "Tuesday Opens at", as: :time_picker
          f.input :tue_close, label: "Tuesdays Closes at", as: :time_picker
          f.input :wed_open, label: "Wednesday Opens at", as: :time_picker
          f.input :wed_close, label: "Wednesday Closes at", as: :time_picker
          f.input :thur_open, label: "Thursday Opens at", as: :time_picker
          f.input :thur_close, label: "Thursday Closes at", as: :time_picker
          f.input :fri_open, label: "Friday Opens at", as: :time_picker
          f.input :fri_close, label: "Friday Closes at", as: :time_picker
          f.input :sat_open, label: "Saturday Opens at", as: :time_picker
          f.input :sat_close, label: "Saturday Closes at", as: :time_picker
          f.input :sun_open, label: "Sunday Opens at", as: :time_picker
          f.input :sun_close, label: "Sunday Closes at", as: :time_picker
        end
      end
    end

    f.actions
  end
  
end
