require 'rails_helper'

RSpec.describe State, type: :model do
  subject{
    described_class.new(ontime: 10, overtime: 15, late: 20)
  }

  it "valid with valid attributes" do
    expect(subject).to be_valid
  end
  
  it "is not valid without ontime" do
    subject.ontime = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without overtime" do
    subject.overtime = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without late" do
    subject.late = nil
    expect(subject).to_not be_valid
  end
end
