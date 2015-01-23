class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @review = current_user.reviews.build
  end

  def edit
  end

  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      redirect_to @review, notice: 'Review was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @review.update(review_params)
      redirect_to @review, notice: 'Review was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @review.destroy
    redirect_to reviews_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    def correct_user
      @review = current_user.reviews.find_by(id: params[:id])
      redirect_to reviews_path, notice: "Not authorized to edit this review" if @review.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:text)
    end
end