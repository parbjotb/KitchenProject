class ProductsController < ApplicationController
  def index
    @products = Product.includes(:manufacturer).all
    @manufacturers = Manufacturer.ordered_by_products.limit(15)
  end

  def show
    @product = Product.find(params[:id])
  end

  def about
    # just setting the path, can leave this empty for now
  end
end
