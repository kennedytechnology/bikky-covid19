class PagesController < ApplicationController
  before_action :find_restaurants, only: [:guides]
  
  def guides
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