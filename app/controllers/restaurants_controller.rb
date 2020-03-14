class RestaurantsController < ApplicationController
  def index
    if params[:q].blank?
      @restaurants = Restaurant.all
    else
      @restaurants = Restaurant.where('name ILIKE ?', "%#{params[:q]}%")
    end
  end
end
