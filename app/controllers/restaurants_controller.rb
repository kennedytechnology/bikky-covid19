class RestaurantsController < ApplicationController
  def index
    if params[:q].blank?
      @restaurants = Restaurant.near("67.244.2.125", 100, order: :distance).limit(50)
    else
      @restaurants = Restaurant.near(params[:q], 0.5, order: :distance)
    end
  end
end
