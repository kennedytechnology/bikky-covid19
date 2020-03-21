ActiveAdmin.register Restaurant do
  menu priority: 1

  # Index
  index do
    selectable_column
    id_column
    column :name
    column :address
    column :partner
    column :created_at
    column :updated_at

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
      row :location
      row :description
      row :latitude
      row :longitude
      row :created_at
      row :updated_at
      row :partner
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
          f.input :partner
          f.input :name, as: :string
          f.input :url
          f.input :address, as: :string
        end
      end
      tab "Additional Information" do
        f.inputs do
          f.input :location
          f.input :description
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
