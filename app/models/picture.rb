class Picture < ApplicationRecord
  has_one_attached :image
  belongs_to :partner
  include Thumbnail

  validates :image, attached: true,
                    content_type: { in: ['image/png', 'image/jpg', 'image/jpeg'], message: 'Not an image' },
                    size: { less_than: 1.megabytes , message: 'File is larger than 1MB' }
end
