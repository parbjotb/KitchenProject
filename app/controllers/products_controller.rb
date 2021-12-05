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

  # def search
  #   wildcard_search = "%#{params[:keywords]}%"
  #   @products = Product.where("name LIKE ?", wildcard_search)
  # end

  # def search
  #   # @tools = if !params[:id].empty?
  #   #            Tool.joins(:tool_types).where(tool_types: { id: params[:id] }).where(
  #   #              "name OR description LIKE ?", "%#{params[:search_term]}%"
  #   #            )
  #   @products = if !params[:id].empty?
  #                 Product.where("manufacturer_id = #{params[:id]}").where(
  #                   "name OR description LIKE ?", "%#{params[:search_term]}%"
  #                 )

  #               else
  #                 #   wildcard_search = "%#{params[:keywords]}%"
  #                 # @tools = Tool.where("name LIKE ?", wildcard_search)
  #                 Product.where("name OR description LIKE ?", "%#{params[:search_term]}%")
  #               end
  # end

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
