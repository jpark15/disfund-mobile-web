require 'rails_helper'

describe QuarterlyBudget do

  let(:test_budget) { FactoryGirl.create(:quarterly_budget, quarter: 3) }

  context "validations" do
    it { should validate_presence_of :quarter }
    it { should validate_presence_of :year }
    it { should validate_presence_of :start_balance }
    it { should validate_presence_of :end_balance }
  end

  context "associations" do
    it { should have_many(:expenditures) }
  end

  context "methods" do
    it "has a working toString method" do
      test_budget.to_s.should eq '2014-Q3'
    end

    it "has a working end balance to string method" do
      test_budget.end_balance_to_s.should eq '---'
    end

    it "has a working current balance method" do
      test_budget.current_balance.should eq 500.0
    end

    it "has a working total cost method" do
      test_budget.total_costs.should eq 0.0
    end
  end
end
