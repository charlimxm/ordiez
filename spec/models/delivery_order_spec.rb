require 'rails_helper'

RSpec.describe DeliveryOrder, type: :model do

  it "is valid with valid attributes" do
    FactoryBot.create(:delivery_order).should be_valid
  end

  it "is not valid without order_id" do
    FactoryBot.build(:delivery_order, order_id: nil).should_not be_valid
  end

  it "is not valid without a serving datetime" do
    FactoryBot.build(:delivery_order, serving_datetime: nil).should_not be_valid
  end

end
