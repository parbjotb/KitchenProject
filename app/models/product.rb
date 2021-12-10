class Product < ApplicationRecord
  has_one_attached :image
  belongs_to :manufacturer
  has_many :product_categories
  has_many :categories, through: :product_categories
  has_many :order_items

  validates :name, :price, :description, presence: true
  validates :price, numericality: true
end
