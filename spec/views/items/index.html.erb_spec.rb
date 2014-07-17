require 'rails_helper'

RSpec.describe "items/index", :type => :view do
  before(:each) do
    assign(:items, [
      Item.create!(
        :type_id => 1,
        :name => "Name",
        :description => "Description",
        :cost => "9.99"
      ),
      Item.create!(
        :type_id => 1,
        :name => "Name",
        :description => "Description",
        :cost => "9.99"
      )
    ])
  end

  it "renders a list of items" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
