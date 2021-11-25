#!/usr/bin/env ruby
# frozen_string_literal: true

# module capybar
module Capybar
  require 'csv'
  require 'capybara'
  require 'capybara/dsl'
  Capybara.default_driver = :selenium
  include Capybara::DSL

  def find_for_load_text_news
    find(:xpath,
         "//*[@id='container']/div/div[2]/div/div/div[3]/
div[1]/div[1]/div/div/div/div[1]/div[2]/div[4]/div/p").text[0..199]
  end

  def find_elements_for_humans(xpath_container)
    visit 'https://www.onliner.by/'
    find(:xpath, xpath_container).text.split("\n").size
  end

  def find_url_for_load_katalog
    if @i == 2
      find(:xpath, "//*[@id='widget-#{@inte}-10']/div[1]/a")['href']
    else
      find(:xpath, "//*[@id='widget-#{@inte}-10']/div/a")['href']
    end
  end

  def find_elements_for_news(xpath_container)
    visit 'https://www.onliner.by/'
    find(:xpath, xpath_container).text.split("\n").size / 2
  end

  def find_picture_url_for_load_news
    if @inte == 1 || @inte == 8
      find(:xpath, "//*[@id='widget-#{@inte}-1']/div[2]/picture/img")[:src]
    else
      find(:xpath, "//*[@id='widget-#{@inte}-1']/div/picture/img")[:src]
    end
  end

  def find_url_for_load_news
    h = { [1] => "//*[@id='widget-#{@inte}-1']/div[2]/a", [2, 3, 7] => "//*[@id='widget-#{@inte}-1']/div/a",
          [4, 5, 6, 9] => "//*[@id='widget-#{@inte}-1']/a[1]", [8] => "//*[@id='widget-#{@inte}-1']/div[4]/a",
          [10, 11] => "//*[@id='widget-#{@inte}-1']/a" }
    find(:xpath, h[@inte])['href']
  end
end

# class scrapper
class Scrapper
  include Capybar

  TEXT_PATH_KAT = '//*[@id="container"]/div/div/div/div/div[3]/div[1]/div[1]/div/div[2]/div/div[1]/div[2]/p[1]'

  def load_text(url)
    visit url
    if @inte == 4
      'Нет доступного текста'
    else
      find(:xpath, TEXT_PATH).text[0..199]
    end
  end

  def load_katalog(csv)
    @inte = 1
    find_elements('//*[@id="container"]/div/div/div/div/div[4]/div[1]').times do
      visit 'https://www.onliner.by/'
      puts title = find(:xpath, "//*[@id='widget-#{@inte}-10']").text
      url = find_url_for_load_katalog
      picture_url = find(:xpath, "//*[@id='widget-#{@inte}-10']/div/picture/img")[:src]
      csv << [title, picture_url, load_text(url)]
      @inte += 1
    end
  end

  def find_elements(xpath_container)
    visit 'https://www.onliner.by/'
    find(:xpath, xpath_container).text.split("\n").size
  end

  def load_text_news(url)
    visit url
    case @inte
    when 1, 3
      'Нет доступного текста'
    when 4, 5, 7, 9, 10, 11
      find_for_load_text_news
    when 6, 8
      find(:xpath,
           "//*[@id='container']/div/div/div/div/div[3]/div[1]/div[1]/div/div[2]/div/div[1]/div[2]/p[1]").text[0..199]
    end
  end

  def load_news(csv)
    @inte = 1
    find_elements_for_news('//*[@id="container"]/div/div/div/div/div[2]/div[1]').times do
      visit 'https://www.onliner.by/'
      puts title = find(:xpath, "//*[@id='widget-#{@inte}-1']").text
      url = find_url_for_load_news
      picture_url = find_picture_url_for_load_news
      csv << [title, picture_url, load_text_news(url)]
      @inte += 1
    end
  end

  def load_text_humans(url)
    visit url
    if @inte == 1
      find(:xpath,
           "//*[@id='container']/div/div/div/div/div[3]/div[1]/div[1]/div/div
/div/div[1]/div[2]/div[4]/div").text[0..199]
    else
      find(:xpath,
           "//*[@id='container']/div/div[2]/div/div/div[3]/div[1]/
div[1]/div/div/div/div[1]/div[2]/div[4]/div").text[0..199]
    end
  end

  def load_humans(csv)
    @inte = 1
    find_elements_for_humans("//*[@id='container']/div/div/div/div/div[7]/ul").times do
      visit 'https://www.onliner.by/'
      puts title = find(:xpath, "//*[@id='container']/div/div/div/div/div[7]/ul/li[#{@inte}]").text
      puts url   = find(:xpath, "//*[@id='container']/div/div/div/div/div[7]/ul/li[#{@inte}]/div/a")['href']
      puts picture_url = find(:xpath,
                              "//*[@id='container']/div/div/div/div/div[7]/ul/li[#{@inte}]/div/picture/img")[:src]
      csv << [title, picture_url, load_text_humans(url)]
      @inte += 1
    end
  end

  def csv
    CSV.open('test.csv', 'wb') do |csv|
      load_katalog(csv)
      load_news(csv)
      load_humans(csv)
    end
  end
end
capybar = Scrapper.new
capybar.csv
