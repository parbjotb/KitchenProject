class ProductsController < ApplicationController
  def index
    # @products = Product.includes(:manufacturer).all
    @products = Product.page(params[:page])
    @manufacturers = Manufacturer.ordered_by_products.limit(15)
  end

  def show
    @product = Product.find(params[:id])
  end

  def about
    # just setting the path, can leave this empty for now
  end

  def search
    @products = if !params[:id].empty?
                  Product.where("manufacturer_id = #{params[:id]}").where(
                    "name OR description LIKE ?", "%#{params[:search_term]}%"
                  )

                else
                  Product.where("name OR description LIKE ?", "%#{params[:search_term]}%")
                end
  end
end
