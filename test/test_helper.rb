ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

require 'capybara/rails'
require 'capybara/minitest'

class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL
  # Make `assert_*` methods behave like Minitest assertions
  include Capybara::Minitest::Assertions

  setup do
    capybara_register
  end
  # Reset sessions and driver between tests
  # Use super wherever this method is redefined in your individual test classes
  teardown do
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end

  def capybara_register
    Capybara.register_driver :chrome do |app|
      profile = Selenium::WebDriver::Chrome::Profile.new
      Capybara::Selenium::Driver.new(app, browser: :chrome, profile: profile).tap do |driver|
        driver.browser.manage.window.size = Selenium::WebDriver::Dimension.new(1024, 800)
      end
    end
  end
  Capybara.current_driver = :chrome
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
