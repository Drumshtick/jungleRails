class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["LOGINNAME"], password: ENV["PASSWRD"] 

  def show
    @products_count = Product.all.count
    @categories_count = Category.all.count
    @categories = Category.all
    @items_per_category = []
    @categories.each do | category |
      @items_per_category.push([category.name, Product.where(category_id: category.id).count])
    end

  end
end
