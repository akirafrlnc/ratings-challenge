class ReviewsController < ApplicationController
	def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.build(review_params)
    if @review.save
      render json: { message: "Review created successfully" }, status: :created
    else
      render json: { errors: @review.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
