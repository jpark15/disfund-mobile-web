require 'rails_helper'

describe QuarterlyBudget do

  let(:test_budget) { FactoryGirl.create(:quarterly_budget, quarter: 3) }

  it "has a valid factory" do
    test_budget.should be_valid
  end

  context "validations" do
    it { should validate_presence_of :quarter }
    it { should validate_presence_of :year }
    it { should validate_presence_of :start_balance }
    it { should validate_presence_of :current_balance }
    it { should validate_presence_of :end_balance }
  end

  context "associations" do
    it { should have_many(:expenditures) }
  end

  context "methods" do
    it "has a working toString method" do
      test_budget.to_s.should eq '2014-Q3'
    end
  end
end
