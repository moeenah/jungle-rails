class ReviewsController < ApplicationController
  before_filter :authorize

  def create
    product = Product.find(params[:product_id])

    review = Review.new(
                        product_id: params[:product_id],
                        user_id: current_user.id,
                        description: params[:review][:description],
                        rating: params[:review][:rating]
                        )
    review.save
      if review.save
        redirect_to product
      else
        redirect_to product
      end
  end

  def destroy
    product = Product.find(params[:id])
    puts 'hi'
    puts params[:review_id]
    destroy_review = Review.destroy(params[:review_id])
    destroy_review.save
      if destroy_review.save
        redirect_to :back
      else
        redirect_to :back
      end
  end

end
