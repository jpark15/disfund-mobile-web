require 'rails_helper'

describe "SettingsTypes" do
  login_admin_user
  subject!(:settings_type) { FactoryGirl.create(:settings_type) }

  let(:index_path) { polymorphic_path([:settings_types]) }
  let(:show_path) { polymorphic_path([settings_type]) }

  describe "index" do
    before { visit index_path }

    it "should have title 'Listing All Expenditures'" do
      expect(page).to have_content('Listing All Expenditure Types')
    end

    it "should have the correct headers" do
      within_table('table1') do
        within('thead') do
          headers = [
            'Description',
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
        within(:row_for, settings_type) do
          head_val_hash = {
            'Description' => 'Default Value' }
          head_val_hash.each do |header, value|
            expect(find(:value_under_header, header)).to have_content(value)
          end
        end
      end
    end

    it "should have create new type button" do
      if current_user.admin
        expect(find('a.lower-link')).to have_content('Create New Type')
      end
    end
  end

  describe "show" do
    before { visit show_path }

    it 'shows the correct headers in order' do
      within('.inline') do
        labels = [
          'Description:']
        labels.each do |label|
          expect(find(:label_at_index, labels.index(label)+1)).to have_content(label)
        end
      end
    end

    it 'contains all column specific values in row' do
      within('.inline') do
        lab_val_hash = {
          'Description:' => 'Default Value'}
        lab_val_hash.each do |label, value|
          expect(find(:dd_for_label, label)).to have_content(value)
        end
      end
    end

    it "should have create new type button" do
      if current_user.admin
        expect(page).to have_content('Edit' && 'Back')
      end
    end
  end
end
