class DeliveryOrder < ApplicationRecord
  has_many :order_items
  has_many :meals, through: :order_items
end
