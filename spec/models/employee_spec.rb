require 'rails_helper'

RSpec.describe Employee, type: :model do
  subject {
    described_class.new(
      first_name: 'Andrew',
      last_name: 'Weir',
      dob: 'april 5 1985',
      marital_status: 0,
      sin: '123456789',
      hire_date: 'last_month'.to_date
    )
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a first name" do
    subject.first_name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a last name" do
    subject.last_name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a dob" do
    subject.dob = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a marital status" do
    subject.marital_status = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a sin" do
    subject.sin = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a hire date" do
    subject.hire_date = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a valid sin" do
    subject.sin = '1234'
    expect(subject).to_not be_valid
  end

  it "encrypts and decrypts the sin" do
    sin = '987654321'
    subject.sin = sin
    expect(subject.encrypted_sin).not_to be_empty
    expect(subject.sin).to eq sin
  end
end
