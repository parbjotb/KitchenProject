class ApplicationController < ActionController::Base
  before_action :initialize_session
  helper_method :cms_pages, :cart
  # by making it a helper method, we can call from anywhere

  private

  def initialize_session
    # this initializes shopping cart if it doesn't exist already
    session[:shopping_cart] ||= [] # empty array of product id's
  end

  def cart
    # pass an array of product id's, get a collection of products in cart
    Product.find(session[:shopping_cart])
  end

  def cms_pages
    Page.all
  end
end
