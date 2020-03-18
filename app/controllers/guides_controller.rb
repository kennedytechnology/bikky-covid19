class GuidesController < ApplicationController
  def index
    @restaurants = Restaurant.joins(:guides).group_by { |r| r.guides.first.name }
  end
end