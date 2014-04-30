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
end

# Configure these to modules as helpers in the appropriate tests.
RSpec.configure do |config|
    # Include the help for the request specs.
    config.include ValidUserRequestHelperCustom, :type => :request
end