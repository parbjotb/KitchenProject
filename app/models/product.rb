class Product < ApplicationRecord
  belongs_to :manufacturer
  has_many :product_categories
  has_many :categories, through: :product_categories

  validates :name, :price, :description, presence: true
  validates :price, numericality: true
end
