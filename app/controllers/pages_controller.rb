class PagesController < ApplicationController
  def guides
    if params[:q].blank?
      @restaurants = Restaurant.all.group_by { |r| r.name }
    else
      @restaurants = Restaurant.near(params[:q], 0.5, order: :distance)
    end
  end
end