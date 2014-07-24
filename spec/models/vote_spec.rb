require 'rails_helper'

describe Vote do

  context "validations" do
    it { should validate_presence_of :user_id }
    it { should validate_numericality_of :user_id }
    it { should validate_presence_of :item_id }
    it { should validate_numericality_of :item_id }
  end

  context "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:item) }
  end
end
