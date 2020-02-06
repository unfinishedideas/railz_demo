require 'pry'

class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :get_user, only: [:create, :new, :edit, :update]
  before_action :find_spot
  # GET /reviews
  # GET /reviews.json
  # def index
  #   @reviews = Review.all
  # end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = @spot.reviews.new(review_params)
    respond_to do |format|
      if @review.save
        format.html { redirect_to "/spots/#{@review.spot_id}", notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to "/spots/#{@review.spot_id}/reviews/#{@review.id}", notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    id = @review.spot_id
    @review.destroy
    respond_to do |format|
      format.html { redirect_to "/spots/#{id}", notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    def find_spot
      @spot = Spot.find(params[:spot_id])
    end

    def get_user
      @user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      # params.fetch(:review, {})
      params.require(:review).permit(:title, :content, :rating, :heat_lvl, :user_id, :spot_id)
    end
end
