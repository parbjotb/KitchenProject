class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.select("manufacturers.*")
                                 .select("COUNT(manufacturers.id) as product_count")
                                 .left_joins(:products)
                                 .group("manufacturers.id")
                                 .order("product_count DESC")
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
  end
end
