class Restaurant < ApplicationRecord
  geocoded_by :address
  after_validation :geocode

  def display_image
    if File.file?("#{Rails.root}/app/assets/images/restaurants_photos/#{image_name}.jpeg")
      return "restaurants_photos/#{image_name}.jpeg"
    else
      return "restaurants_photos/amma.jpeg"
    end
  end

  def image_name
    name.parameterize.underscore
  end
end
