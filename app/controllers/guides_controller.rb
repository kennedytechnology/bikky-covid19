class GuidesController < ApplicationController
  before_action :find_restaurants, only: [:index]
  
  def index
  end

  private

  def find_restaurants
    if params[:q].blank?
      @restaurants = Restaurant.all.group_by { |r| r.name }
    else
      @restaurants = Restaurant.near(params[:q], 0.5, order: :distance).group_by { |r| r.name }
    end
  end
end