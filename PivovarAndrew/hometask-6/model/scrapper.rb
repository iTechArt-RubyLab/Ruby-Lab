# !/usr/bin/env ruby
# frozen_string_literal: true

require 'capybara'
require 'capybara/dsl'
require './model/driver_setup'

# Class responsible for scrap and import required information from the web site
class WebSiteScraper
  include Capybara::DSL
  attr_reader :data, :web_site_info

  MIN_TEXT_LENGTH = 0
  MAX_TEXT_LENGTH = 200
  WEB_SITE_INFO = {
    ADDRESS: 'https://www.onliner.by/',
    SECTION_SELECTOR: '.widget-item',
    H_SELECTOR: '.b-tile-header',
    IMG_SELECTOR: 'picture img',
    P_SELECTOR: '.b-tile-excerpt'
  }.freeze

  def initialize
    @web_site_info = WEB_SITE_INFO
    @data = []
    Capybara.ignore_hidden_elements = false
  end

  def scrap_web_site
    DriverSetup.new.setup_driver
    Capybara.visit @web_site_info[:ADDRESS]
    @data = scrap_section(@web_site_info[:SECTION_SELECTOR],
                          @web_site_info[:H_SELECTOR],
                          @web_site_info[:IMG_SELECTOR],
                          @web_site_info[:P_SELECTOR])
  end

  private

  def scrap_section(section_selector, title_selector, image_url_selector, text_selector)
    Capybara.all(section_selector).reduce([]) do |memo, element|
      memo << {
        title: element.find(title_selector)[:innerText],
        image_url: element.find(image_url_selector)[:src],
        text: element.find(text_selector)[:innerText][MIN_TEXT_LENGTH..MAX_TEXT_LENGTH],
      }
    end
  end
end
