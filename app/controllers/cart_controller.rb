class CartController < ApplicationController
  def create
    # Adds params[:id] to cart
    # id relates to the product you click add to cart on
    # when creating a new cart item, its done when a user clicks a new item to add
    # using the id they clicked, we create a cart item
    # the logger will show in the rails server.. super useful for debugging!!
    logger.debug("Adding #{params[:id]} to cart.")
    # all query params come in as strings, so you need to convert to integer
    # to put it into the id array it had to be an integer
    id = params[:id].to_i
    # now the shopping cart array contains the id of the new product
    session[:shopping_cart] << id # pushes id onto the end of the array/list

    # Get the product from the id that the user selected
    # get the name of that product and add it to the flash notification
    # flash notification is used in application.html.erb
    product = Product.find(id)
    # show user that product was added
    flash[:notice] = "➕ #{product.name} added to cart."

    redirect_to root_path
  end

  # DELETE /cart/:id
  def destroy
    # removes params[:id] from cart
    logger.debug("Removing #{params[:id]} from cart.")
    id = params[:id].to_i
    # removes that product id from the array of product ids
    session[:shopping_cart].delete(id)
    product = Product.find(id)
    flash[:notice] = " - #{product.name} removed from cart."
    redirect_to root_path
  end

  def show
    # @cart = Cart.find(params[:id])
    logger.debug("Items in cart:" + session[:shopping_cart].inspect)
    @items_in_cart = session[:shopping_cart].count
  end
end
