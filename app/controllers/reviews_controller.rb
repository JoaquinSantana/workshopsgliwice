class ReviewsController < ApplicationController
  before_action :authenticate_user!
  expose(:review)
  expose(:product)

  def edit
  end

  def create
    self.review = current_user.reviews.create(review_params)
    if review.save
      product.reviews << review
      redirect_to category_product_url(product.category, product), notice: 'Review was successfully created.'
    else
      redirect_to :back
      flash[:danger] = "Something went wrong"
    end
  end

  def destroy
    review.destroy
    redirect_to category_product_url(product.category, product), notice: 'Review was successfully destroyed.'
  end

  private
    def review_params
      params.require(:review).permit(:content, :rating)
    end
end
