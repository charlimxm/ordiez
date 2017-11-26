FactoryBot.define do
  factory :delivery_order do
    order_id "GO001"
    serving_datetime { Faker::Time.forward(30, :morning) }
  end
end
