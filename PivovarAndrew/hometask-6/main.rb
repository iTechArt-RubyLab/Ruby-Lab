# !/usr/bin/env ruby
# frozen_string_literal: true

require './model/scrapper'
require './model/csv_writer'
require 'rspec'

# Main class
class Main
  def run_cli
    CSVWriter.new(WebSiteScraper.new.scrap_web_site).import_to_csv
  end
end

Main.new.run_cli
