require 'capybara/rspec'
require 'selenium/webdriver'

RSpec.configure do |config|
  config.include Capybara::DSL

  Capybara.register_driver :selenium_chrome do |app|
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless') # Run Chrome in headless mode (no GUI)
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
  end

  Capybara.javascript_driver = :selenium_chrome

  config.before(:each, type: :feature) do
    Capybara.current_driver = :rack_test
  end

  config.before(:each, type: :feature, js: true) do
    Capybara.current_driver = :selenium_chrome
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
