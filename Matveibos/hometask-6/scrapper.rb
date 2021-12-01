#!/usr/bin/env ruby
# frozen_string_literal: true

require 'csv'
require 'capybara'
require 'capybara/dsl'

PATH_TO_CONTAINER_SPORT = '/html/body/div[1]/div/div/div/div/div/div[6]/div[5]/div[1]'
PATH_TO_CONTAINER_PEOPLES = '/html/body/div[1]/div/div/div/div/div/div[7]/ul'
PATH_TO_CONTAINER_CATALOG = '/html/body/div[1]/div/div/div/div/div/div[4]/div[2]/div/div[1]'
PATH_TO_CONTAINER_SUB_CATALOG = '/html/body/div[1]/div/div/div/div/div/div[7]/ul'

# module find information
module Finder
  include Capybara::DSL

  Capybara.default_driver = :selenium
  Capybara.app_host = 'https://www.onliner.by'
  Capybara.visit('/')

  def find_images(path, comment)
    @answer << ["\n#{comment}:"]
    within(:xpath, path) do
      page.all('img').each do |img|
        @answer << [(img['src']).to_s]
      end
    end
  end

  def find_titles(path, tag, style_class, comment)
    @answer << ["\n#{comment}:"]
    within(:xpath, path) do
      page.all(tag, class: style_class).each do |title|
        @answer << [title.text.to_s]
      end
    end
  end

  def find_symbols(path, tag, style_class, comment)
    @answer << ["\n\n#{comment}:"]
    within(:xpath, path) do
      page.all(tag, class: style_class).each do |title|
        @answer << [title.text[0...200].to_s]
      end
    end
  end
end

# Write to array
class Answer
  include Finder

  def initialize
    @answer = []
  end

  attr_reader :answer
end

# Write to file
class FileWriter
  def write(answer)
    CSV.open('file.csv', 'wb') do |csv|
      answer.each do |row|
        csv << row
      end
    end
  end
end

infomation = Answer.new
csv_file = FileWriter.new

infomation.find_images(PATH_TO_CONTAINER_SPORT, 'sport image')
infomation.find_titles(PATH_TO_CONTAINER_SPORT, 'h3', 'b-tile-header', 'sport titles')
infomation.find_symbols(PATH_TO_CONTAINER_SPORT, 'a', 'b-tile-main', 'sport infomation')
infomation.find_images(PATH_TO_CONTAINER_PEOPLES, 'peoples image')
infomation.find_titles(PATH_TO_CONTAINER_PEOPLES, 'div', 'b-opinions-main-2__text',
                       'people titles')
infomation.find_images(PATH_TO_CONTAINER_CATALOG, 'catalog image')
infomation.find_titles(PATH_TO_CONTAINER_CATALOG, 'div', 'catalog-offers__title', 'catalog titles')
infomation.find_symbols(PATH_TO_CONTAINER_SUB_CATALOG, 'div', 'b-opinions-main-2__inner',
                        'catalog information')
csv_file.write(infomation.answer)
