class ReviewsController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.build(review_params)
    protect_from_forgery with: :null_session
    if @review.save
      render json: { message: "Review created successfully" }, status: :created
    else
      render json: { errors: @review.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def review_params
    @product_id = params.require(:product_id)
    params.require(@product_id).permit(:rating, :comment)
  end
end
