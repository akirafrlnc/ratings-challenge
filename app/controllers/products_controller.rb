class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
    @average_rating = @product.reviews.average(:rating).to_f.round(1)
  end
end
