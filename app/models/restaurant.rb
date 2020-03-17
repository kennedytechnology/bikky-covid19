class Restaurant < ApplicationRecord
  belongs_to :partner
  has_and_belongs_to_many :guides

  geocoded_by :address
  after_validation :geocode

  def display_image
    if File.file?("#{Rails.root}/app/assets/images/restaurants_photos/#{image_name}.jpeg")
      return "restaurants_photos/#{image_name}.jpeg"
    else
      return "restaurants_photos/default.jpeg"
    end
  end

  def image_name
    name.parameterize.underscore
  end
end
