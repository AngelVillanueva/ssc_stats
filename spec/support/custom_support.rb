# This support package contains custom modules for this app
# for request specs.

# This module authenticates users for request specs.#
module ValidUserRequestHelperCustom
    # Define a method which signs in as a valid user.
    def go_home_and_login
      visit root_path
      fill_in "usuario[email]", with: usuario.email
      fill_in "usuario[password]", with: usuario.password
      click_button I18n.t( 'devise.custom.sign_in' )
    end
    def go_dashboard_and_login
      visit rails_admin.dashboard_path
      fill_in "usuario[email]", with: usuario.email
      fill_in "usuario[password]", with: usuario.password
      click_button I18n.t( 'devise.custom.sign_in' )
    end
    def click_the_menu_link_for model
      model_menu_link = find( :css, "li[data-model=\"#{model}\"] a" )
      model_menu_link.click
    end
    def click_the_action_link_for action
      action_link = find( :css, "li.#{action}_collection_link a")
      action_link.click
    end
    def click_next_page_link
      next_page_link = find( :css, "td.other a" )
      next_page_link.click
    end
end

# Configure these to modules as helpers in the appropriate tests.
RSpec.configure do |config|
    # Include the help for the request specs.
    config.include ValidUserRequestHelperCustom, :type => :request
end