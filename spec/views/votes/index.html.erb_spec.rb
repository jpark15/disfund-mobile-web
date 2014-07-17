require 'rails_helper'

RSpec.describe "votes/index", :type => :view do
  before(:each) do
    assign(:votes, [
      Vote.create!(
        :user_id => 1,
        :item_id => 2
      ),
      Vote.create!(
        :user_id => 1,
        :item_id => 2
      )
    ])
  end

  it "renders a list of votes" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
