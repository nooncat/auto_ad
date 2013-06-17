#encoding: UTF-8
# == Schema Information
#
# Table name: cars
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  yearofrelease :string(255)
#  price         :string(255)
#  describtion   :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'spec_helper'

describe Car do
  
  before { @car = Car.new(name: "Example car name",
                          yearofrelease: "2013",
                          price: "100000", describtion: "cool car") }
  subject { @car }
                         
  it { should respond_to(:name) }
  it { should respond_to(:yearofrelease) }
  it { should respond_to(:price) }
  it { should respond_to(:describtion) }
  it { should respond_to(:photos) }

  it { should be_valid }

  describe "when name is not present" do
    before { @car.name = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @car.name = "a" * 31 }
    it { should_not be_valid }
  end

  describe "when yearofrelease is not present" do
    before { @car.yearofrelease = " " }
    it { should_not be_valid }
  end

  describe "when yearofrelease is too long" do
    before { @car.yearofrelease = "a" * 16 }
    it { should_not be_valid }
  end
  
  describe "when price is not present" do
    before { @car.price = " " }
    it { should_not be_valid }
  end
  
  describe "when price is too long" do
    before { @car.price = "a" * 16 }
    it { should_not be_valid }
  end
  
  describe "when describtion is not present" do
    before { @car.describtion = " " }
    it { should_not be_valid }
  end

  describe "when describtion is too long" do
    before { @car.describtion = "a" * 1501 }
    it { should_not be_valid }
  end
end
