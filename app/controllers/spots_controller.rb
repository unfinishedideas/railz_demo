require 'pry'

class SpotsController < ApplicationController
  before_action :set_spot, only: [:show, :edit, :update, :destroy]
  before_action :authorize, only: [:index, :show, :edit, :create, :update, :destroy, :new]

  # GET /spots
  # GET /spots.json
  def index
    # Idea: for the list of spots to display: find the 10 closest to your location
    @spots = Spot.all
  end

  # GET /spots/1
  # GET /spots/1.json
  def show
    @response = HTTParty.get("https://api.openweathermap.org/data/2.5/weather?lat=#{@spot.lat}&lon=#{@spot.lon}&appid=#{Rails.application.credentials.weather_api_key}")
    @reviews = @spot.reviews

    @avg_rating = 0
    @reviews.each do |review|
      @avg_rating += review.rating
    end
    @avg_rating = @avg_rating / @reviews.length

    @med_heat = 0
    
  end

  # GET /spots/new
  def new
    @spot = Spot.new
  end

  # GET /spots/1/edit
  def edit
  end

  # POST /spots
  # POST /spots.json
  def create
    @spot = Spot.new(spot_params)
    @spots = Spot.all
    respond_to do |format|
      if @spot.save
        format.html { redirect_to @spot, notice: 'Spot was successfully created.' }
        format.json { render :show, status: :created, location: @spot }
      else
        format.html { render :new }
        format.json { render json: @spot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spots/1
  # PATCH/PUT /spots/1.json
  def update
    respond_to do |format|

      if @spot.update(spot_params)
        format.html { redirect_to @spot, notice: 'Spot was successfully updated.' }
        format.json { render :show, status: :ok, location: @spot }
        @spot.photos.attach(params[:spot][:photos])
      else
        format.html { render :edit }
        format.json { render json: @spot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spots/1
  # DELETE /spots/1.json
  def destroy
    @spot.destroy
    respond_to do |format|
      format.html { redirect_to spots_url, notice: 'Spot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_spot
    @spot = Spot.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def spot_params
    params.require(:spot).permit(:name, :lat, :lon, :spot_type, :features, :description, photo: [])
  end


end
