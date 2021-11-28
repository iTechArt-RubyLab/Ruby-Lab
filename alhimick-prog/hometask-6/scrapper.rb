#!/usr/bin/env ruby
# frozen_string_literal: true

require 'selenium-webdriver'
require 'nokogiri'
require 'capybara'
require 'capybara/rspec'
require 'capybara/dsl'

class OnlinerScrapper
  include Capybara::DSL

  HOME_PAGE_URL = 'https://www.onliner.by/'

  def initialize
    @all_links = []
    @required_blocks = ['.//div[@class="b-tiles-outer "]',
                        './/div[@class="b-catalog-layer"]',
                        './/ul[@class="b-opinions-main-2"]']
  end

  def scrapper()
    initialize_capybara_and_webdriver
    open_home_page
    @required_blocks.each { |block| link_collector(block) }
    puts @all_links.size
    itself_scrapper
  end

  private

  def initialize_capybara_and_webdriver
    caps = Selenium::WebDriver::Remote::Capabilities.chrome('goog:chromeOptions' => {
    args: ['start-maximized']})
    Capybara.register_driver :selenium do |app|
      Capybara::Selenium::Driver.new(app, browser: :chrome, capabilities: caps)
    end
    Capybara.javascript_driver = :chrome
    Capybara.configure do |config|  
      config.default_max_wait_time = 10
      config.default_driver = :selenium
    end
  end

  def open_home_page
    browser = Capybara.current_session
    driver = browser.driver.browser
    browser.visit HOME_PAGE_URL
    file = File.new('homepage', 'w')
    Nokogiri::HTML(driver.page_source).to_s.each_line do |line|
      file.write(line)
    end
  end

  def link_collector(block)
    within(:xpath, block) do
      all(:xpath, './/a').each do |elem|
        if /https:\/\/.+\.onliner\.by\/.+/ =~ elem[:href]
          need_to_be_pushed = true
          @all_links.each { |i| need_to_be_pushed = false if i.eql?(elem[:href])}
          @all_links.push(elem[:href]) if need_to_be_pushed
        end
      end
    end
  end

  def itself_scrapper
    results = File.new('onliner.csv', 'w')
    browser = Capybara.current_session
    driver = browser.driver.browser
    @all_links.each do |link|
      browser.visit link
      results.write(extractor)
    end
  end

  def extractor()
    'something'
  end

end

OnlinerScrapper.new.scrapper
