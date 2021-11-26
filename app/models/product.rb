class Product < ApplicationRecord
  belongs_to :manufacturer
  validates :name, :price, :description, presence: true
  validates :price, numericality: true
end
