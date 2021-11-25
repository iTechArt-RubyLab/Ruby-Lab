#!/usr/bin/env ruby
# frozen_string_literal: true

require 'csv'
require 'capybara'
require 'capybara/dsl'
require 'pry'

# this class is used for parsing web-page
class Parser
  include Capybara::DSL

  Capybara.default_driver = :selenium_chrome
  Capybara.app_host = 'https://www.onliner.by'
  Capybara.visit('/')

  def initialize
    @answer = []
  end

  attr_reader :answer

  def find_images(path, comment)
    @answer << ["\n\n#{comment}:"]
    within(:xpath, path) do
      page.all('img').each do |img|
        @answer << ["\t#{img['src']}"]
      end
    end
  end

  def find_titles(path, tag, style_class, comment)
    @answer << ["\n\n#{comment}:"]
    within(:xpath, path) do
      page.all(tag, class: style_class).each do |title|
        @answer << ["\t#{title.text}"]
      end
    end
  end

  def find_symbols(path, tag, style_class, comment)
    @answer << ["\n\n#{comment}:"]
    within(:xpath, path) do
      page.all(tag, class: style_class).each do |title|
        @answer << ["\t#{title.text[0...200]}"]
      end
    end
  end
end

# this class write info into file
class FileWriter
  def write(answer)
    CSV.open('file.csv', 'wb') do |csv|
      answer.each do |row|
        csv << row
      end
    end
  end
end

parser = Parser.new
csv = FileWriter.new

# news
# it scrapps news images
parser.find_images('/html/body/div[1]/div/div/div/div/div/div[2]/div[1]', 'news image')
# it scrapps news titles
parser.find_titles('/html/body/div[1]/div/div/div/div/div/div[2]/div[1]', 'h3', 'b-tile-header', 'news titles')
# scrapps news symbols
parser.find_symbols('/html/body/div[1]/div/div/div/div/div/div[2]/div[1]', 'div', 'tiles-widget', 'news symbols')

# peoples
# it scrapps peoples images
parser.find_images('/html/body/div[1]/div/div/div/div/div/div[7]/ul', 'peoples image')
# scrapps peoples titles
parser.find_titles('/html/body/div[1]/div/div/div/div/div/div[7]/ul', 'div', 'b-opinions-main-2__text', 'people titles')
# scrapps peoples symbols
parser.find_symbols('/html/body/div[1]/div/div/div/div/div/div[4]/div[2]/div/div[1]', 'div', 'catalog-offers__title',
                    'people symbols')

# catalog
# it scrapps catalog images
parser.find_images('/html/body/div[1]/div/div/div/div/div/div[4]/div[2]/div/div[1]', 'catalog image')
# scrapps catalog titles
parser.find_titles('/html/body/div[1]/div/div/div/div/div/div[4]/div[2]/div/div[1]', 'div', 'catalog-offers__title',
                   'catalog titles')
# scrapps catalog symbols
parser.find_symbols('/html/body/div[1]/div/div/div/div/div/div[7]/ul', 'div', 'b-opinions-main-2__inner',
                    'catalog symbols')

csv.write(parser.answer)
