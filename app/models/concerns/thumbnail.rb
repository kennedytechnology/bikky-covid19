module Thumbnail
  extend ActiveSupport::Concern

  included do
    def thumb
      self.image.variant(resize: '200x200').processed
    end
  end

end