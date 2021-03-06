# frozen_string_literal: true

require 'selenium-webdriver'
require 'nokogiri'
require 'capybara'
require 'pry'
require 'csv'

# Configurations
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end
Capybara.javascript_driver = :chrome
Capybara.configure do |config|
  config.default_max_wait_time = 10 # seconds
  config.default_driver = :selenium
end
# Visit
browser = Capybara.current_session

# CATALOG
browser.visit('https://onliner.by')
browser.all('a', text: 'КАТАЛОГ').first.click
columns = browser.find('div', class: 'tiles').all('div', class: 'tiles__column')
catalogs_links = columns.map do |column|
  column.all('div', class: 'tiles__item').map do |item|
    item.find('a', class: 'b-tile-main')['href']
  end
end.flatten

catalogs_result =
  catalogs_links.map do |catalog_links|
    browser.visit(catalog_links)

    items = browser.all('div', class: 'schema-product__group')
    items.map do |item|
      title = item.all('div', class: 'schema-product__title').first.text
      text = item.find('div', class: 'schema-product__description').text[0...200]

      image =
        begin
          item.find('img')['src']
        rescue StandardError
          'no-image'
        end

      [image, title, text]
    end
  end

browser.visit('https://onliner.by')

# #TEHNOLOGY
browser.all('a', text: 'ТЕХНОЛОГИИ').first.click
technology_links = browser.all('a', class: 'news-tiles__stub').map { |item| item['href'] }

technology_result =
  technology_links.map do |technology_link|
    browser.visit(technology_link)
    image = browser.find('div', class: 'news-header__image')['style'].scan(/https:.+\.jpeg/).first
    title = browser.find('h1').text
    text = browser.find('.news-text').text[0...200]

    [image, title, text]
  end

# #PEOPLE

browser.visit('https://onliner.by')
browser.all('a', text: 'ЛЮДИ').first.click
people_links = browser.all('a', class: 'news-tiles__stub').map { |item| item['href'] }

people_result =
  people_links.map do |people_link|
    browser.visit(people_link)
    image = browser.find('div', class: 'news-header__image')['style'].scan(/https:.+\.jpeg/).first
    title = browser.find('h1').text
    text = browser.find('.news-text').text[0...200]

    [image, title, text]
  end

CSV.open('result.csv', 'w') do |csv|
  technology_result.each do |row|
    csv << row
  end

  people_result.each do |row|
    csv << row
  end

  catalogs_result.each do |row|
    csv << row
  end
end
