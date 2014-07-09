require 'rails_helper'

describe Expenditure do

  it "has a valid factory" do
    FactoryGirl.create(:expenditure).should be_valid
  end

  context "validations" do
    it { should validate_presence_of :item }
    it { should validate_presence_of :cost }
    it { should validate_presence_of :quarterly_budget_id }
    it { should validate_presence_of :purchase_date }
    it { should validate_presence_of :type_id }
  end

  context "associations" do
    it { should belong_to(:quarterly_budget) }
    it { should belong_to(:settings_type) }
  end
end
