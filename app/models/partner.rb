class Partner < ApplicationRecord
  has_many :restaurants
  has_and_belongs_to_many :guides
  has_one :picture, as: :pictureable

  accepts_nested_attributes_for :picture, reject_if: lambda { |a| a[:image].blank? }, allow_destroy: true

  def name; brand; end;
end
