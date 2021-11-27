class Category < ApplicationRecord
  has_many :product_categories
  has_many :products, through: :product_categories
  validates :name, presence: true, uniqueness: true

  def self.products_in_category
    self.select("categories.*")
        .select("COUNT(categories.id) as category_count")
        .left_joins(:products)
        .group("categories.id")
        .order("category_count DESC")
  end
end
