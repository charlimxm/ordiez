FactoryBot.define do
  factory :order_item do
    delivery_order nil
    meal nil
    quantity 1
    unit_price 1
  end
end
