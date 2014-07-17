require 'rails_helper'

RSpec.describe "votes/edit", :type => :view do
  before(:each) do
    @vote = assign(:vote, Vote.create!(
      :user_id => 1,
      :item_id => 1
    ))
  end

  it "renders the edit vote form" do
    render

    assert_select "form[action=?][method=?]", vote_path(@vote), "post" do

      assert_select "input#vote_user_id[name=?]", "vote[user_id]"

      assert_select "input#vote_item_id[name=?]", "vote[item_id]"
    end
  end
end
