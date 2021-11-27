#!/usr/bin/env ruby
# frozen_string_literal: true

require 'selenium-webdriver'
require 'nokogiri'
require 'capybara'

class OnlinerScrapper
  BEGIN_BLOCK_POSITION = 0
  END_BLOCK_POSITION = 1
  COUNTER_OF_END = 3
  END_OF_BLOCK_SEQUENCE = '</div>'

  def initialize
    @home_page = []
    @all_links = []
    @news_borders = []
    @catalog_borders = []
    @people_borders = []
    @start_news_block_sequence = '<div class="b-tiles-outer ">'
    @start_catalog_block_sequence = ''
    @start_people_block_sequence = ''
  end

  def scrapper()
    initialize_capybara_and_webdriver
    create_array_from_home_page
    block_border_searcher(@start_news_block_sequence, @news_borders)
    #block_border_searcher(@start_catalog_block_sequence, @catalog_borders)
    #block_border_searcher(@start_people_block_sequence, @people_borders)
    puts @news_borders
  end

  private

  def initialize_capybara_and_webdriver
    Capybara.register_driver :selenium do |app|  
      Capybara::Selenium::Driver.new(app, browser: :chrome)
    end
    Capybara.javascript_driver = :chrome
    Capybara.configure do |config|  
      config.default_max_wait_time = 10
      config.default_driver = :selenium
    end
  end

  def create_array_from_home_page
    browser = Capybara.current_session
    driver = browser.driver.browser
    browser.visit 'https://www.onliner.by/'
    Nokogiri::HTML(driver.page_source).to_s.each_line do |line|
      @home_page.push(line)
    end
  end

  def block_border_searcher(begin_of_block_sequence, borders)
    begin_of_block_searcher(begin_of_block_sequence, borders)
    return unless borders[BEGIN_BLOCK_POSITION]

    end_of_block_searcher(borders)
  end

  def begin_of_block_searcher(begin_of_block_sequence, borders)
    @home_page.each_with_index do |line, index|
      if /#{begin_of_block_sequence}/ =~ line
        borders[BEGIN_BLOCK_POSITION] = index
        break
      end
    end
  end
  
  def end_of_block_searcher(borders)
    @home_page[(borders[BEGIN_BLOCK_POSITION])...(@home_page.size)].each_with_index do |line, index|
      counter = 0
      if /#{END_OF_BLOCK_SEQUENCE}/ =~ line
        @home_page[(index + borders[BEGIN_BLOCK_POSITION] - COUNTER_OF_END)...(index + borders[BEGIN_BLOCK_POSITION])].each do |previous_line|
          counter += 1 if /#{END_OF_BLOCK_SEQUENCE}/ =~ previous_line
        end
      end
      if counter == COUNTER_OF_END
        borders[END_BLOCK_POSITION] = index + borders[BEGIN_BLOCK_POSITION]
        break
      end
    end
  end

end

OnlinerScrapper.new.scrapper
