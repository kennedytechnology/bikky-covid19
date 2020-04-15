class Restaurant < ApplicationRecord
  belongs_to :partner
  geocoded_by :address
  after_validation :geocode, if: -> { address.present? && address_changed? }
  scope :published, -> {where(is_published: true)}
  delegate :brand, to: :partner
  delegate :deal, to: :partner

  validates_presence_of :brand, :address

  def tags
    [partner.mood, partner.daypart_1, partner.daypart_2, partner.meal_size_1, partner.meal_size_2, "$" * partner.price.to_i].reject(&:blank?)
  end
end
