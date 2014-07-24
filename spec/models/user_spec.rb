require 'rails_helper'

describe User do
  context "associations" do
    it { should have_many(:votes) }
  end
end
