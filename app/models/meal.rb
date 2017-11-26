class Meal < ApplicationRecord
  validates_presence_of :name, :description
  has_many :order_items
  has_many :delivery_orders, through: :order_items
end
