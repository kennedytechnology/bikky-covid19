class RestaurantsController < ApplicationController
  def index
    if params[:q].blank?
      @restaurants = Restaurant.all
    else
      @restaurants = Restaurant.near(params[:q], 0.5, order: :distance)
    end
  end
end
