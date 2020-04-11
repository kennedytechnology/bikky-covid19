class RestaurantsController < ApplicationController
  def index

    @restaurants = Restaurant.all.published
    if search_tags.any?
      @restaurants = @restaurants.where(partner: matching_partners)
    end

    if params[:q].present?
      @restaurants = @restaurants.near(params[:q], 50, order: :distance)
    else
      if Geocoder.search(remote_ip).first && Geocoder.search(remote_ip).first.coordinates.any?
        @restaurants = @restaurants.near(remote_ip, 100000, order: :distance)
      else
        @restaurants = @restaurants.order("RANDOM()")
      end
    end

    @restaurants = @restaurants.includes(:partner).limit(50)
  end
  
  private

  def search_params
    params.permit(:q, :filter0, :filter1, :filter2, :filter3, :commit)
  end

  def search_tags
    search_params.to_h.collect{|k,v| v if k.include?("filter")}.reject(&:blank?)
  end

  def matching_partners
    Partner.all.select{|p|
      search_tags.all?{|tag| [p.mood, p.daypart_1, p.daypart_2, p.meal_size_1, p.meal_size_2, p.price.to_s].include?(tag)}
    }
  end

  def remote_ip
    if forwarded = request.env["HTTP_X_FORWARDED_FOR"]
      forwarded.split(",").first
    elsif addr = request.env["REMOTE_ADDR"]
      addr
    end
  end
end
