class OrderItem < ApplicationRecord
  validates_presence_of :delivery_order_id, :meal_id, :quantity, :unit_price
  belongs_to :delivery_order
  belongs_to :meal
  has_many :feedbacks, as: :ratable
end
