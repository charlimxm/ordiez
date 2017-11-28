# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Delete data before recreating data
# Meal.destroy_all
# DeliveryOrder.destroy_all
# OrderItem.destroy_all

10.times do

  meal = Meal.new
  meal.name = Faker::Food.dish
  meal.description = Faker::Lorem.paragraph

  meal.save

end


5.times do |i|

  deliveryOrder = DeliveryOrder.new
  deliveryOrder.order_id = "GO"+(i+1).to_s.rjust(3,'0')
  deliveryOrder.serving_datetime = Time.now.strftime("%Y-%m-%d %H:%M")
  deliveryOrder.feedback_submitted = false

  deliveryOrder.save

end


deliveryOrder_array = [1, 2, 3, 4, 5]
orderItem_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

3.times do

  deliveryOrder_array.each do |deliveryOrder|

    orderItem = OrderItem.new
    orderItem.delivery_order_id = deliveryOrder
    orderItem.meal_id = orderItem_array.to_a.shuffle.pop
    orderItem.quantity = rand(1..10)
    orderItem.unit_price = rand(2000)

    orderItem.save

  end

end

#   # Feedback for delivery order
#
# 5.times do |i|
#
#   feedback = Feedback.new
#   feedback.ratable_id = i
#   feedback.ratable_type = "DeliveryOrder"
#   feedback.rating = ([*-1..1] - [0]).sample
#   feedback.comment = Faker::Lorem.paragraph
#
#   feedback.save
#
# end
#
#   # Feedback for order item
#
# orderItem_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
#
# 3.times do
#
#   orderItem_array.each do |i|
#
#     feedback = Feedback.new
#     feedback.ratable_id = i
#     feedback.ratable_type = "OrderItem"
#     feedback.rating = ([*-1..1] - [0]).sample
#     feedback.comment = Faker::Lorem.paragraph
#
#     feedback.save
#
#   end
#
# end
