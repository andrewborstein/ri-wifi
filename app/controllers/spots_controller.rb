class SpotsController < ApplicationController
  before_action :set_spot, only: [:show, :edit, :update, :destroy]
  helper_method :icanhazip
  helper_method :icanhazgeo
  helper_method :icanhazapt
  helper_method :ip_address
  helper_method :ip_address_geo
  respond_to :html

  def index
    if params[:search].present?
      @spots = Spot.near(params[:search])
      respond_with(@spots)
    else
      @spots = Spot.all.order(name: :asc)
      respond_with(@spots)
    end
  end

  def show
    respond_with(@spot)
  end

  def new
    @spot = Spot.new
    respond_with(@spot)
  end

  def edit
  end

  def create
    @spot = Spot.new(spot_params)
    @spot.save
    respond_with(@spot)
  end

  def update
    @spot.update(spot_params)
    respond_with(@spot)
  end

  def destroy
    @spot.destroy
    respond_with(@spot)
  end

  def fastest
    @spots = Spot.all.order(dl: :desc)
    respond_with(@spots)
  end

  def nearby
    @spots = Spot.all.order(latitude: :desc)
    respond_with(@spots)
  end

  def ip_address
    request.remote_ip
    @ip_normal = request.remote_ip
  end

  def ip_address_geo
    ip = request.remote_ip
    @geo = Geocoder.coordinates(ip)
  end

  def icanhazip
    require 'net/http'

    url = URI.parse('http://icanhazip.com/')
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    ip = res.body.gsub("\n","")
    @ip = ip
  end

  def icanhazgeo
    require 'net/http'

    url = URI.parse('http://icanhazip.com/')
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    ip = res.body.gsub("\n","")
    @geo = Geocoder.coordinates(ip)
  end

  private
    def set_spot
      @spot = Spot.find(params[:id])
    end

    def spot_params
      params.require(:spot).permit(:name, :ssid, :pw, :pw_open, :pw_login, :dl, :ul, :address, :latitude, :longitude, :icanhazip, :website, :yelp, :facebook)
    end
end
