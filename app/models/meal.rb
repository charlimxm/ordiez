class Meal < ApplicationRecord
  has_many :order_items
  has_many :delivery_orders, through: :order_items
end
