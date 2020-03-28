class Restaurant < ApplicationRecord
  belongs_to :partner
  geocoded_by :address

  delegate :brand, to: :partner
  delegate :deal, to: :partner

  # validates_presence_of :name, :address

  def display_image
    if File.file?("#{Rails.root}/app/assets/images/restaurants_photos/#{image_name}.jpeg")
      return "restaurants_photos/#{image_name}.jpeg"
    else
      return "restaurants_photos/default.jpg"
    end
  end

  def image_name
    brand.parameterize.underscore
  end

  def tags
    [partner.mood, partner.daypart_1, partner.daypart_2, partner.meal_size_1, partner.meal_size_2, "$" * partner.price.to_i].reject(&:blank?)
  end
end
