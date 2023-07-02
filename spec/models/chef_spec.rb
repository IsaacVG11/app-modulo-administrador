require 'rails_helper'

RSpec.describe Chef, type: :model do
  subject { 
    described_class.new(full_name: 'Isaac Villalobos Gonzalez',
                        email: 'isaacs@gmail.com',
                        password: 'teo1234')
  } 

  it "valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without full_name" do
      subject.full_name = nil
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
end
