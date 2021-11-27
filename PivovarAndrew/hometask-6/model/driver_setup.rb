# !/usr/bin/env ruby
# frozen_string_literal: true

require 'selenium-webdriver'

# Class responsible for setup web driver
class DriverSetup
  def setup_driver
    Capybara.default_driver = :selenium
    Capybara.register_driver :selenium do |app|
      Capybara::Selenium::Driver.new(app, browser: :edge)
    end
  end
end
