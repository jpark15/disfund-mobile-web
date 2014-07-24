require 'rails_helper'

describe Item do

  let(:test_item) { FactoryGirl.create(:item) }

  context "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :cost }
    it { should validate_numericality_of :cost }
  end

  context "associations" do
    it { should have_many(:votes) }
    it { should belong_to(:settings_type) }
  end
  
  context "methods" do
    it "has a working vote_count method" do
      test_item.vote_count.should eq 0
    end
  end
end
