class Partner < ApplicationRecord
  has_many :restaurants
  has_and_belongs_to_many :guides
end
