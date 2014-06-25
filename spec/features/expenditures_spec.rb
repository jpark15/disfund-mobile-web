require 'rails_helper'

describe "Expenditures" do

  let(:index_path) { '/expenditures' }

  describe "index" do

    before { visit index_path }

    it "should have title 'Listing All Expenditures'" do
      expect(page).to have_content('Listing All Expenditures')
    end

    it "should have the correct headers" do
      within_table('table1') do
        within('thead') do
          headers = [
            'Year-Q#',
            'Purchase Date',
            'Cost',
            'Item',
            'Type',
            'Notes',
            'Refunded',
            'Links']
          headers.each do |header|
            expect(find(:header_at_index, headers.index(header)+1)).to have_content(header)
          end
        end
      end
    end

    it "should have the correct values under each header" do
      within_table('table1') do
        save_and_open_page
        # within(:row_for, budget) do
        #   head_val_hash = {
        #     'Year-Q#' => ,
        #     'Purchase Date' => ,
        #     'Cost' => ,
        #     'Item' => ,
        #     'Type' => ,
        #     'Notes' => ,
        #     'Refunded' => ,
        #     'Links' => }
        #   head_val_hash.each do |header, value|
        #     expect(find(:value_under_header, header)).to have_content(value)
        #   end
        # end
      end
    end
  end

  describe "show" do

  end
end