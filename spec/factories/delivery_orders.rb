FactoryBot.define do
  factory :delivery_order do
    order_id { 2.times.map { [*'A'..'Z'].sample }.join + 3.times.map { [*'0'..'9'].sample }.join }
    serving_datetime { Faker::Time.forward(30, :morning) }
  end
end
