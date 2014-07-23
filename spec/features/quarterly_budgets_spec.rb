require 'rails_helper'

describe "QuarterlyBudgets" do
  login_admin_user
  let!(:expenditure) { FactoryGirl.create(:expenditure) }
  let!(:quarterly_budget) { expenditure.quarterly_budget }
  # subject!(:quarterly_budget) { FactoryGirl.create(:quarterly_budget, quarter: 2) }
  # let(:expenditure) { FactoryGirl.create(:expenditure) }

  let(:index_path) { polymorphic_path([:quarterly_budgets]) }
  let(:show_path) { polymorphic_path([quarterly_budget]) }

  describe "index" do
    before { visit index_path }

    it "should have title 'Listing All Quarterly Budgets'" do
      expect(page).to have_content('Listing All Quarterly Budgets')
    end

    it "should have the correct headers" do
      within_table('table1') do
        within('thead') do
          headers = [
            'Year-Q#',
            'Starting Balance',
            'Current Balance',
            'Ending Balance',
            'Links']
          headers.each do |header|
            expect(find(:header_at_index, headers.index(header)+1)).to have_content(header)
          end
        end
      end
    end

    it "should have the correct values under each header" do
      within_table('table1') do
        within(:row_for, quarterly_budget) do
          head_val_hash = {
            'Year-Q#' => '2014-Q2',
            'Starting Balance' => '$500.00',
            'Current Balance' => '$500.00',
            'Ending Balance' => '---'}
          head_val_hash.each do |header, value|
            expect(find(:value_under_header, header)).to have_content(value)
          end
        end
      end
    end

    it "should have create new expenditure button" do
      if current_user.admin
        expect(find('a.lower-link')).to have_content('Create New Quarterly Budget')
      end
    end
  end

  describe "show" do
    before { visit show_path }

    it 'shows the correct headers in order' do
      within('.inline') do
        labels = [
          'Year:',
          'Quarter:',
          'Start Balance',
          'Current Balance',
          'End Balance']
        labels.each do |label|
          expect(find(:label_at_index, labels.index(label)+1)).to have_content(label)
        end
      end
    end

    it 'contains all column specific values in row' do
      within('.inline') do
        lab_val_hash = {
          'Year:' => '2014',
          'Quarter:' => '2',
          'Start Balance:' => '$500.00',
          'Current Balance:' => '$500.00',
          'End Balance:' => '---'}
        lab_val_hash.each do |label, value|
          expect(find(:dd_for_label, label)).to have_content(value)
        end
      end
    end

    it 'should have heading listing all corresponding expenditures' do
      expect(page).to have_content('Listing All Corresponding Expenditures')
    end

    it 'shows the correct expenditures headers in order' do
      within_table('table1') do
        within('thead') do
          headers = [
            'Purchase Date',
            'Cost',
            'Item',
            'Type',
            'Notes',
            'Refunded']
          headers.each do |header|
            expect(find(:header_at_index, headers.index(header)+1)).to have_content(header)
          end
        end
      end
    end

    it 'contains all column specific values in row for corresponding expenditures' do
      within_table('table1') do
        within(:row_for, expenditure) do
          head_val_hash = {
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

    it 'should have heading listing all corresponding expenditures' do
      expect(page).to have_content('Create New Expenditure')
    end
  end
end
