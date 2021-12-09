#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative './scrapper/parser'
require_relative './scrapper/file_writer'

parser_results = Scrapper::Parser.new('onliner').call
Scrapper::FileWriter.new(parser_results).call
