require 'rails_helper'

describe SettingsType do

  it "has a valid factory" do
    FactoryGirl.create(:settings_type).should be_valid
  end

  context "validations" do
    it { should validate_presence_of :description }
    it { should validate_presence_of :internal_symbol }
  end

  context 'associations' do
    it { should have_many(:expenditures) }
  end

  context 'methods' do
    it "has correct internal symbol" do
      type = FactoryGirl.create(:settings_type, description: 'Test Case')
      type.internal_symbol.should eq 'test_case'
    end
  end
end
