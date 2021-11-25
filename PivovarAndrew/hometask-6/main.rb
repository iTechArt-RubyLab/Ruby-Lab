# !/usr/bin/env ruby
# frozen_string_literal: true

require "capybara"
require "selenium-webdriver"
require "capybara/rspec"
require "csv"
require "./model/my_hash"
require "./model/data_parse"

# Main class
class Main
  WEB_SITE_INFO = {
    address: "https://onliner.by",
    css_classes: {
      section: ".widget-item",
      h: ".b-tile-header",
      img: "picture img",
      p: ".b-tile-excerpt",
    },
  }

  def run_cli
    run_test_one
    # run_test_two
  end

  private

  def run_test_one
    WebSiteScraper.new(WEB_SITE_INFO).scrap_web_site.import_to_csv
  end

  def run_test_two
  end
end

Main.new.run_cli
