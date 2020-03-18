class GuidesController < ApplicationController
  def index
    @guides = Guide.includes(:partners).all
  end
end