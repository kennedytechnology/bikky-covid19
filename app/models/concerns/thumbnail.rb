module Thumbnail
  extend ActiveSupport::Concern

  included do
    def thumb
      self.picture.variant(resize: '200x200').processed
    end
  end

end