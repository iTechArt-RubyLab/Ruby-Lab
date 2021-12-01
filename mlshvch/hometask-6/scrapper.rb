#!/usr/bin/env ruby
# frozen_string_literal: true

require 'csv'
require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'

SCRAPING_WEBSITE = 'https://www.onliner.by'
NEWS_CSS_SELECTORS = %w[widget-1-1 widget-2-1 widget-3-1 widget-4-1 widget-5-1 widget-6-1 widget-7-1 widget-8-1
                        widget-9-1 widget-10-1 widget-11-1 widget-12-1].freeze
CATALOG_CSS_SELECTOR = 'div.catalog-offers__item'
PEOPLE_NEWS_SELECTOR = 'ul.b-opinions-main-2'
# class for parsing webpage data
class Scraper
  include Capybara::DSL

  attr_reader :result

  def initialize
    @result = []
    configure_capybara
  end

  def scrape_data
    extract_html if @html.nil?
    extract_news_data
    extract_catalog_data
    write_to_csv
  end

  private

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

  def parse_news(block)
    title = block.search('.b-tile-header').text.strip
    picture = block.at_css('img')
    picture = !picture.nil? ? picture.attr('src') : block.search('i.b-tile-bg').attr('style').text[21...-1]
    text = !block.search('.b-tile-excerpt').nil? ? block.search('.b-tile-excerpt').text : ''
    [title, picture, text]
  end

  def extract_news_data
    NEWS_CSS_SELECTORS.each do |selector|
      block = @html.search("div##{selector}")
      @result << parse_news(block)
    end
  end

  def extract_catalog_data
    @html.search(CATALOG_CSS_SELECTOR).each do |block|
      title = block.at_css('.catalog-offers__title').text.strip
      picture = block.css('img').attr('src').text
      text = ''
      @result << [title, picture, text]
    end
  end

  def write_to_csv
    file = File.open('data.csv', 'w')
    @result.each do |data|
      file.write(data.join("\t").concat("\n"))
    end
  end
end
