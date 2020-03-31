class Picture < ApplicationRecord
  belongs_to :pictureable, polymorphic: true
  has_one_attached :image
end
