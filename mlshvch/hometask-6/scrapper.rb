#!/usr/bin/env ruby
# frozen_string_literal: true

require 'csv'
require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'

SCRAPING_WEBSITE = 'https://www.onliner.by'

# class for parsing webpage data
class Scraper
  include Capybara::DSL

  def initialize
    @result = {}
    configure_capybara
  end

  def configure_capybara
    Capybara.default_driver = :selenium
    Capybara.app_host = SCRAPING_WEBSITE
  end

  def extract_dom
    page.find('div', class: 'catalog-offers__preview')
  end
end

scraper = Scraper.new
scraper.extract_dom
