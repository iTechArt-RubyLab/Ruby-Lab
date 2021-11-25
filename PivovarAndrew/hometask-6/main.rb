# !/usr/bin/env ruby
# frozen_string_literal: true

require './model/web_site_scraper'
require 'rspec'

# Main class
class Main
  WEB_SITE_INFO = {
    ADDRESS: 'https://onliner.by',
    CSS_CLASSES: {
      SECTION: '.widget-item',
      H: '.b-tile-header',
      IMG: 'picture img',
      P: '.b-tile-excerpt'
    }
  }

  def run_cli
    run_onliner_scenario
  end

  private

  def run_onliner_scenario
    WebSiteScraper.new(WEB_SITE_INFO).scrap_web_site.import_to_csv
  end
end

Main.new.run_cli
