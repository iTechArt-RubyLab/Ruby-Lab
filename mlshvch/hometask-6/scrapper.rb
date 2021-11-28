#!/usr/bin/env ruby
# frozen_string_literal: true

require 'csv'
require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'

SCRAPING_WEBSITE = 'https://www.onliner.by'
NEWS_CSS_SELECTOR = ''
CATALOG_CSS_SELECTOR = 'div.catalog-offers'
PEOPLE_NEWS_SELECTOR = 'ul.b-opinions-main-2'
# class for parsing webpage data
class Scraper
  include Capybara::DSL

  def initialize
    @result = {}
    configure_capybara
  end

  def configure_capybara
    Capybara.register_driver(:selenium) { |app| Capybara::Selenium::Driver.new(app, browser: :firefox) }
    Capybara.javascript_driver = :chrome
    Capybara.configure do |config|
      config.default_max_wait_time = 10 # seconds
      config.default_driver = :selenium
    end
  end

  def extract_html
    browser = Capybara.current_session
    driver = browser.driver.browser
    browser.visit(SCRAPING_WEBSITE)
    @html = Nokogiri::HTML(driver.page_source)
  end

  def extract_data(css_selector)
    @html.search(".#{css_selector}")
  end
end
