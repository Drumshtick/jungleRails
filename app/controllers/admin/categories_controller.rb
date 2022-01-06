class Admin::CategoriesController < ApplicationController

  def index
    @categories = Category.order(id: :desc).all
    @categories_plus_count = []
    @categories.each do | category |
      @categories_plus_count.push([
        category.name,
        Product.where(category_id: category.id).count,
        category.created_at,
        category.updated_at
      ])
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Categoru created!'
    else
      render :new
    end
  end

  def category_params
    params.require(:category).permit(
      :name
    )
  end

end
