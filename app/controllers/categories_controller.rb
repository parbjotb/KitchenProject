class CategoriesController < ApplicationController
  def index
    @categories = Category.products_in_category
  end

  def show
    @category = Category.find(params[:id])
  end
end
