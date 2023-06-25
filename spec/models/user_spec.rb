require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(first_name: 'John', 
                        last_name: 'Jhonson', 
                        email: 'john@email.com', 
                        password: 'jhon1234', 
                        role: 1)
  }

  it "valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without first_name" do
      subject.first_name = nil
      expect(subject).to_not be_valid
  end

  it "is not valid without last_name" do
    subject.last_name = nil
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

  it "is not valid without role" do
    subject.role = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with invalid email format" do
    subject.email = "invalid_email"
    expect(subject).to_not be_valid
  end
end

