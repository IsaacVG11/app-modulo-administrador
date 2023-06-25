require 'rails_helper'

RSpec.describe Client, type: :model do
  subject { 
    described_class.new(full_name: 'Isaac Villalobos Gonzalez',
                        address: 'Condominio Lomas del Bosque',
                        email: 'isaacs@gmail.com',
                        password: 'teo1234',
                        client_state: 1)
  } 

  it "valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without full_name" do
      subject.full_name = nil
      expect(subject).to_not be_valid
  end

  it "is not valid without address" do
    subject.address = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without password" do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without client_state" do
    subject.client_state = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with invalid email format" do
    subject.email = "invalid_email"
    expect(subject).to_not be_valid
  end
end
