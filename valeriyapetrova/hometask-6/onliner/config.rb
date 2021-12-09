# frozen_string_literal: true

require 'selenium-webdriver'
require 'nokogiri'
require 'capybara'
# rubocop:disable Metrics/MethodLength
# go to onliner
class Config
  def config(link)
    Capybara.register_driver :selenium do |app|
      Capybara::Selenium::Driver.new(app, browser: :chrome)
    end
    Capybara.javascript_driver = :chrome
    Capybara.configure do |config|
      config.default_max_wait_time = 10
      config.default_driver = :selenium
    end
    browser = Capybara.current_session
    driver = browser.driver.browser
    browser.visit link
    driver.page_source
  end
end
# rubocop:enable Metrics/MethodLength
