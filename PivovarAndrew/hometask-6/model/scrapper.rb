# !/usr/bin/env ruby
# frozen_string_literal: true

require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'
require 'csv'
require './model/page_selector'

# Class responsible for scrap and import required information from the web site
class WebSiteScraper
  include Capybara::DSL
  attr_reader :data, :web_site_info

  CSV_DATA_PATH = './file/data.csv'
  CSV_DATA_HEADER = %w[Title Image_URL Text].freeze
  MIN_TEXT_LENGTH = 0
  MAX_TEXT_LENGTH = 200

  def initialize(web_site_info)
    @web_site_info = web_site_info
    @data = []
    Capybara.ignore_hidden_elements = false
  end

  def scrap_web_site
    driver_setup
    Capybara.visit @web_site_info[:ADDRESS]
    css_classes = @web_site_info[:CSS_CLASSES]
    @data = scrap_section(PageSelector.new(css_classes[:SECTION], css_classes[:H], css_classes[:IMG], css_classes[:P]))
    self
  end

  def import_to_csv
    CSV.open(CSV_DATA_PATH, 'wb') do |csv|
      csv << CSV_DATA_HEADER
      @data.each do |section|
        csv << [section[:title], section[:image_url], section[:text]]
      end
    end
  end

  private

  def scrap_section(page_selector)
    Capybara.all(page_selector.section_selector).reduce([]) do |memo, element|
      memo << {
        title: element.find(page_selector.title_selector)[:innerText],
        image_url: element.find(page_selector.image_url_selector)[:src],
        text: element.find(page_selector.text_selector)[:innerText][MIN_TEXT_LENGTH..MAX_TEXT_LENGTH]
      }
    end
  end

  def driver_setup
    Capybara.default_driver = :selenium
    Capybara.register_driver :selenium do |app|
      Capybara::Selenium::Driver.new(app, browser: :edge)
    end
  end
end
