require 'rails_helper'

RSpec.describe Admin, type: :model do
  subject{
    described_class.new(email: "isaac@gmail.com", password: "password1234")
  }

  it "valid with valid attributes" do
    expect(subject).to be_valid
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
