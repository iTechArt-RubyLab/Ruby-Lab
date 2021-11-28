# frozen_string_literal: true

require 'open-uri'
require 'csv'
require 'selenium-webdriver'
require 'nokogiri'
require 'capybara'
require 'pry'
# Configurations
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end
Capybara.javascript_driver = :chrome
Capybara.configure do |config|
  config.default_max_wait_time = 10 # seconds
  config.default_driver = :selenium
end

def cap(url)
  browser = Capybara.current_session
  browser.visit 'https://onliner.by'

  arr = []
  browser.find(url).text[0..199].split('\/n').each do |element|
    arr << element
  end

  CSV.open('onliner.csv', 'a') do |csv|
    csv << arr
  end
end

cap('div.b-tiles-outer')
cap('div.b-main-page-catalog-layer')
cap('ul.b-opinions-main-2')
