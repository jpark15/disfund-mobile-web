require 'rails_helper'

describe "QuarterlyBudgets" do
  login_admin_user
  let!(:item) { FactoryGirl.create(:item) }

  let(:index_path) { polymorphic_path([:items]) }

  describe "index" do
    before { visit index_path }

    it "should have title 'Listing All Items'" do
      expect(page).to have_content('Listing All Items')
    end

    it "should have the correct headers" do
      within_table('table1') do
        within('thead') do
          headers = [
            'Name',
            'Description',
            'Type',
            'Cost',
            'Total Votes',
            '',
            'Links']
          headers.each do |header|
            expect(find(:header_at_index, headers.index(header)+1)).to have_content(header)
          end
        end
      end
    end

    it "should have the correct values under each header" do
      within_table('table1') do
        within(:row_for, item) do
          head_val_hash = {
            'Name' => 'Chipotle',
            'Description' => 'Burrito',
            'Type' => 'Default Value',
            'Cost' => '$10.00',
            'Total Votes' => ''}
          head_val_hash.each do |header, value|
            expect(find(:value_under_header, header)).to have_content(value)
          end
        end
      end
    end

    it "should have create new expenditure button" do
      expect(find('a.lower-link')).to have_content('Create New Item')
    end
  end
end
