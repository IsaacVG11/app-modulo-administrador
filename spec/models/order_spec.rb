require 'rails_helper'

RSpec.describe Order, type: :model do
  subject{
    described_class.new(order_time: Time.now,
                        order_date: Date.today,
                        order_state: 0,
                        client: Client.create(full_name: 'Isaac Villalobos Gonzalez',
                          address: 'Condominio Lomas del Bosque',
                          email: 'isaacs@gmail.com',
                          password: 'teo1234',
                          client_state: 1))
  }

  it "valid with valid attributes" do
    expect(subject).to be_valid
  end
  
  it "is not valid without order_time" do
    order = Order.new(order_time: nil)
    expect(order).to_not be_valid
  end

  it "is not valid without order_date" do
    order = Order.new(order_date: nil)
    expect(order).to_not be_valid
  end

  it "is not valid without order_state" do
    order = Order.new(order_state: nil)
    expect(order).to_not be_valid
  end
end
