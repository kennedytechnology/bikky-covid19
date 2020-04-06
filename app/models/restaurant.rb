class Restaurant < ApplicationRecord
  belongs_to :partner
  geocoded_by :address

  delegate :brand, to: :partner
  delegate :deal, to: :partner

  validates_presence_of :brand, :address

  def display_image
    if File.file?("#{Rails.root}/app/assets/images/restaurants_photos/#{image_name}.jpeg")
      return "restaurants_photos/#{image_name}.jpeg"
    else
      return "restaurants_photos/default.jpeg"
    end
  end

  def image_name
    brand.parameterize.gsub(/[^0-9a-z]/i, '')
  end

  def tags
    [partner.mood, partner.daypart_1, partner.daypart_2, partner.meal_size_1, partner.meal_size_2, "$" * partner.price.to_i].reject(&:blank?)
  end
end
