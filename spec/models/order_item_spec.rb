require 'rails_helper'

RSpec.describe OrderItem, type: :model do

  it "is valid with valid attributes" do

    Meal.new(name: "Fish and Chips", description: "test test test")
    DeliveryOrder.new(order_id: "GO001", serving_datetime: "2017-11-26 06:40:00")

    FactoryBot.create(:delivery_order).should be_valid
  end

  it "is not valid without a delivery order id" do
    FactoryBot.build(:order_item, delivery_order_id: nil).should_not be_valid
  end

  it "is not valid without a meal id" do
    FactoryBot.build(:order_item, meal_id: nil).should_not be_valid
  end

  it "is not valid without a quantity" do
    FactoryBot.build(:order_item, quantity: nil).should_not be_valid
  end

  it "is not valid without a unit price" do
    FactoryBot.build(:order_item, unit_price: nil).should_not be_valid
  end

end
