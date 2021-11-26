class ProductsController < ApplicationController
  def index
    @products = Product.includes(:manufacturer).all
    @manufacturers = Manufacturer.select("manufacturers.*")
                                 .select("COUNT(manufacturers.id) as product_count")
                                 .left_joins(:products)
                                 .group("manufacturers.id")
                                 .order("product_count DESC")
                                 .limit(15)
  end

  def show
    @product = Product.find(params[:id])
  end
end
