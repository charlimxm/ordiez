require 'rails_helper'

RSpec.describe Meal, type: :model do

  it "is valid with valid attributes" do
    FactoryBot.create(:meal).should be_valid
  end

  it "is not valid without a name" do
    FactoryBot.build(:meal, name: nil).should_not be_valid
  end

  it "is not valid without a description" do
    FactoryBot.build(:meal, description: nil).should_not be_valid
  end

end
