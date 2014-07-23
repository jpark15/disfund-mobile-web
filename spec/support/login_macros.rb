require 'rack_session_access'
require 'rack_session_access/capybara'

module LoginMacros
  extend ActiveSupport::Concern

  module ClassMethods
    def login_user(&block)
      if block
        yield
      else
        let!(:current_user) { FactoryGirl.create(:user) }
      end

      before do
        page.set_rack_session(user_id: current_user.id)
      end
    end

    def login_admin_user
      login_user do
        let!(:current_user) { FactoryGirl.create(:admin_user) }
      end
    end
  end
end

RSpec.configuration.include LoginMacros, type: :feature
