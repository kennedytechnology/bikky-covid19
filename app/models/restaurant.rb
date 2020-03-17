class Restaurant < ApplicationRecord
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode
end
