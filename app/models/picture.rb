class Picture < ApplicationRecord
  has_one_attached :image
  belongs_to :partner
  include Thumbnail
end
