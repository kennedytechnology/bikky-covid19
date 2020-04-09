class Partner < ApplicationRecord
  has_many :restaurants
  has_and_belongs_to_many :guides
  has_one_attached :picture
  include Thumbnail
  validates :picture, content_type: { in: ['image/png', 'image/jpg', 'image/jpeg'], message: 'Not an image' },
                    size: { less_than: 1.megabytes , message: 'File is larger than 1MB' }
  validates_presence_of :brand, :price

  def name; brand; end;
end
