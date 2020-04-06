class Partner < ApplicationRecord
  has_many :restaurants
  has_and_belongs_to_many :guides
  has_one :picture
  has_one_attached :picture, dependent: :destroy

  accepts_nested_attributes_for :picture, reject_if: lambda { |a| a[:image].blank? }, allow_destroy: true

  def name; brand; end;

  def picture_attributes=(attributes)
    picture.purge if has_destroy_flag?(attributes)
  end

  def picture_url
    if picture.attached?
      picture
    else
      ActionController::Base.helpers.image_url("restaurants_photos/default.jpeg")
    end
  end
end
