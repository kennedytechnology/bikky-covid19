class Restaurant < ApplicationRecord
  geocoded_by :address
  after_validation :geocode

  validates_presence_of :name, :url, :location, :description, :address
end
