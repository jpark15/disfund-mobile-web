require 'rails_helper'

describe "Expenditures" do

  subject!(:expenditure) { FactoryGirl.create(:expenditure) }

  let(:index_path) { polymorphic_path([:expenditures]) }
  let(:show_path) { polymorphic_path([expenditure]) }

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
        within(:row_for, expenditure) do
          head_val_hash = {
            'Year-Q#' => '2014-Q2',
            'Purchase Date' => 'Oct 07, 1993',
            'Cost' => '$0.00',
            'Item' => 'Default Item',
            'Type' => 'Default Value',
            'Notes' => 'Default Notes',
            'Refunded' => 'False'}
          head_val_hash.each do |header, value|
            expect(find(:value_under_header, header)).to have_content(value)
          end
        end
      end
    end
  end

  describe "show" do
    before { visit show_path }

    it 'shows the correct headers in order' do
      within('.inline') do
        labels = [
          'Quarterly Budget:',
          'Purchase Date:',
          'Item:',
          'Type:',
          'Cost:',
          'Notes:',
          'Refunded:']
        labels.each do |label|
          expect(find(:label_at_index, labels.index(label)+1)).to have_content(label)
        end
      end
    end

    it 'contains all column specific values in row' do
      within('.inline') do
        lab_val_hash = {
          'Quarterly Budget:' => expenditure.quarterly_budget,
          'Purchase Date:' => '1993-10-07',
          'Item:' => 'Default Item',
          'Type:' => 'Default Value',
          'Cost:' => '$0.00',
          'Notes:' => 'Default Notes',
          'Refunded:' => 'False'}
        lab_val_hash.each do |label, value|
          expect(find(:dd_for_label, label)).to have_content(value)
        end
      end
    end
  end
end
