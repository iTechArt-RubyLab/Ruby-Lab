#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative './scrapper/parser'
require_relative './scrapper/report_generator'
require_relative './scrapper/file_writer'

parser_results = Scrapper::Parser.new('onliner').call
report = Scrapper::ReportGenerator.new(parser_results).call
Scrapper::FileWriter.new(report).call
