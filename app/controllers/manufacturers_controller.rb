class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.ordered_by_products
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
  end
end
