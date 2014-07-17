require 'rails_helper'

RSpec.describe "items/edit", :type => :view do
  before(:each) do
    @item = assign(:item, Item.create!(
      :type_id => 1,
      :name => "MyString",
      :description => "MyString",
      :cost => "9.99"
    ))
  end

  it "renders the edit item form" do
    render

    assert_select "form[action=?][method=?]", item_path(@item), "post" do

      assert_select "input#item_type_id[name=?]", "item[type_id]"

      assert_select "input#item_name[name=?]", "item[name]"

      assert_select "input#item_description[name=?]", "item[description]"

      assert_select "input#item_cost[name=?]", "item[cost]"
    end
  end
end
