class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @reviews = Review.where(product_id: params[:id])
    @users = {}
    @reviews.each do |item|
      user = User.where(id: item.user_id).pluck(:first_name)
      @users.store(item.user_id, user)
    end
  end

end
