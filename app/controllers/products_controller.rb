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

  def search
    wildcard_search = "%#{params[:keywords]}%"
    @products = Product.where("name LIKE ?", wildcard_search)
  end
end
