require 'rails_helper'

RSpec.describe Dish, type: :model do
  subject {
    described_class.new(dish_name: 'Hamburguesa', 
                        description: 'Hamburguesa smash de doble torta', 
                        price: 10.5, 
                        dish_image: 'imagen',
                        dish_state: 1)
  }

  it "valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without dish_name" do
      subject.dish_name = nil
      expect(subject).to_not be_valid
  end

  it "is not valid without description" do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without price" do
    subject.price = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without dish_image" do
    subject.dish_image = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without dish_state" do
    subject.dish_state = nil
    expect(subject).to_not be_valid
  end
end
