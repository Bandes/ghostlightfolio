require 'capybara/rails'
require 'capybara/rspec'
require "selenium/webdriver"

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.register_driver :headless_chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: {
      args: %w[headless enable-features=NetworkService,NetworkServiceInProcess]
    }
  )

  browser_options = Selenium::WebDriver::Chrome::Options.new
  browser_options.headless!

  Capybara::Selenium::Driver.new app,
    browser: :chrome,
    options: browser_options,
    desired_capabilities: capabilities
end

Capybara.default_driver = :headless_chrome
Capybara.javascript_driver = :headless_chrome
