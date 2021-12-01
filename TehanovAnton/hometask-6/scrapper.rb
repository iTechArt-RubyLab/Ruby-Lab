# frozen_string_literal: true

require 'capybara/rspec'
require 'pry'
require 'csv'
require_relative 'scrapper/config'
require_relative 'scrapper/parser'
require_relative 'scrapper/report'

config = Config.new.read('onliner.json')
data = Parser.new(config).parse
Report.new(data, config).report
