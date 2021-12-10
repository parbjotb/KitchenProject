class Order < ApplicationRecord
  belongs_to :order_status
  belongs_to :users
  has_many :order_items
end
