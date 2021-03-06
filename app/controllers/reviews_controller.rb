# frozen_string_literal: true

class ReviewsController < ProtectedController
  before_action :set_review, only: %i[show update destroy]

  # GET /reviews
  def index
    @reviews = current_user.reviews.all

    render json: @reviews
  end

  # GET /reviews/1
  def show
    render json: @review
  end

  # POST /reviews
  def create
    @review = current_user.reviews.build(review_params)

    if @review.save
      render json: @review, status: :created, location: @review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reviews/1
  def update
    if @review.update(review_params)
      render json: @review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reviews/1
  def destroy
    @review.destroy
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = current_user.reviews.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def review_params
      params.require(:review).permit(:name, :phone, :address, :vehicle, :shovel, :payment, :respectful, :punctual, :honest, :attitude, :teamPlayer, :trustworthy, :openToFeedback, :communication, :comments)
    end
end
