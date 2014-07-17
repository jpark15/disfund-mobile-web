require 'rails_helper'

RSpec.describe "items/new", :type => :view do
  before(:each) do
    assign(:item, Item.new(
      :type_id => 1,
      :name => "MyString",
      :description => "MyString",
      :cost => "9.99"
    ))
  end

  it "renders new item form" do
    render

    assert_select "form[action=?][method=?]", items_path, "post" do

      assert_select "input#item_type_id[name=?]", "item[type_id]"

      assert_select "input#item_name[name=?]", "item[name]"

      assert_select "input#item_description[name=?]", "item[description]"

      assert_select "input#item_cost[name=?]", "item[cost]"
    end
  end
end
