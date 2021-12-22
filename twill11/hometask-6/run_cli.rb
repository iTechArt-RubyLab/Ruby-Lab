# !/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'lib/parser'
require_relative 'lib/csv_writer'

# Getting tag and count from user
class RunCli
  def run_cli
    print 'Enter your tag: '
    @tag = gets.chomp
    print 'Enter count of: '
    @count = gets.chomp.to_i
    info_of_rows
    write_to_csv
    puts 'File was generated successfully!'
  end

  private

  attr_reader :tag, :count

  def write_to_csv
    CsvWriter.new(info_of_rows).csv_writer(tag)
  end

  def info_of_rows
    Parser.new.data_scrap(tag, count)
  end
end

RunCli.new.run_cli
