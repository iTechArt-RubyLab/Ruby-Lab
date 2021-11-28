#!/usr/bin/env ruby
# frozen_string_literal: true

require 'selenium-webdriver'
require 'nokogiri'
require 'capybara'
require 'capybara/rspec'
require 'capybara/dsl'
require 'csv'

# Scrapper for Onliner
class OnlinerScrapper
  include Capybara::DSL

  HOME_PAGE_URL = 'https://www.onliner.by/'
  TITLE = './/h1'
  IMAGE = '<div class="news-header__image"'
  TEXT_MAX_LENGTH = 200

  def initialize
    @all_links = []
    @required_blocks = ['.//div[@class="b-tiles-outer "]',
                        './/div[@class="b-catalog-layer"]',
                        './/ul[@class="b-opinions-main-2"]']
    @results = File.new('onliner.csv', 'w')
  end

  def scrapper
    initialize_capybara_and_webdriver
    open_home_page
    @required_blocks.each { |block| link_collector(block) }
    itself_scrapper
  end

  private

  def initialize_capybara_and_webdriver
    caps = Selenium::WebDriver::Remote::Capabilities.chrome('goog:chromeOptions' => { args: ['start-maximized'] })
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
    browser.visit HOME_PAGE_URL
  end

  def link_collector(block)
    within(:xpath, block) do
      all(:xpath, './/a').each do |elem|
        next unless %r{https:/.+\.onliner\.by..} =~ elem[:href]

        need_to_be_pushed = true
        @all_links.each { |i| need_to_be_pushed = false if i.eql?(elem[:href]) }
        @all_links.push(elem[:href]) if need_to_be_pushed
      end
    end
  end

  def itself_scrapper
    browser = Capybara.current_session
    @all_links.each do |link|
      browser.visit link
      extracting_and_inserting
    end
  end

  def extracting_and_inserting
    @results.write("#{title_extractor},#{image_link_extractor},#{text_extractor}\n")
  end

  def title_extractor
    find(:xpath, './/h1').text
  end

  def image_link_extractor
    find(:xpath, './/div[@class="news-header__image"]')[:style].match(/https.+jpeg/)
  rescue Capybara::ElementNotFound
    nil
  end

  def text_extractor
    text = ''
    all(:xpath, './/p').each do |elem|
      text += elem.text
    end
    return nil if text.empty?

    text.size > 200 ? text.slice(0...TEXT_MAX_LENGTH) : text
  end
end

OnlinerScrapper.new.scrapper
