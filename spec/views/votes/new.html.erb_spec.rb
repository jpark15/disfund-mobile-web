require 'rails_helper'

RSpec.describe "votes/new", :type => :view do
  before(:each) do
    assign(:vote, Vote.new(
      :user_id => 1,
      :item_id => 1
    ))
  end

  it "renders new vote form" do
    render

    assert_select "form[action=?][method=?]", votes_path, "post" do

      assert_select "input#vote_user_id[name=?]", "vote[user_id]"

      assert_select "input#vote_item_id[name=?]", "vote[item_id]"
    end
  end
end
