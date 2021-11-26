class Manufacturer < ApplicationRecord
  has_many :products
  validates :name, presence: true

  def self.ordered_by_products
    self.select("manufacturers.*")
        .select("COUNT(manufacturers.id) as product_count")
        .left_joins(:products)
        .group("manufacturers.id")
        .order("product_count DESC")
  end
end
