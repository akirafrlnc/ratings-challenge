class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
		# get average rating and send it to show page
    @average_rating = @product.reviews.average(:rating).to_f.round(1)
  end
end
