class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.ordered_by_products
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
  end

  def about
    # just setting the path, can leave this empty for now
  end
end
