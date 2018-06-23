class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @review = Review.where(product_id: params[:id]).order(created_at: :desc)
    @create_review = @product.reviews.create
  end

end
