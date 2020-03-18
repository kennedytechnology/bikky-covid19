class GuidesController < ApplicationController
  def index
    @guides = Guide.includes(:restaurants).all
  end
end