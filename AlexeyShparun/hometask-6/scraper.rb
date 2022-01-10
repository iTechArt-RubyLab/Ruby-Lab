# frozen_string_literal: true

require 'selenium-webdriver'
require 'capybara'
require 'csv'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end
Capybara.javascript_driver = :chrome
Capybara.configure do |config|
  config.default_max_wait_time = 10 # seconds
  config.default_driver = :selenium
end

browser = Capybara.current_session

browser.visit('https://onliner.by')
browser.all('a', text: 'КОШЕЛЕК').first.click
money_links = browser.all('a', class: 'news-tiles__stub').find.map { |item| item['href'] }

money_result =
  money_links.map do |money_link|
    browser.visit(money_link)
    image = browser.find('div', class: 'news-header__image')['style'].scan(/https:.+\.jpeg/).first
    title = browser.find('h1').text
    text = browser.find('.news-text').text[0...200]

    [image, title, text]
  end

browser.visit('https://onliner.by')
browser.all('a', text: 'ЛЮДИ').first.click
people_links = browser.all('a', class: 'news-tiles__stub').find.map { |item| item['href'] }

people_result =
  people_links.map do |people_link|
    browser.visit(people_link)
    image = browser.find('div', class: 'news-header__image')['style'].scan(/https:.+\.jpeg/).first
    title = browser.find('h1').text
    text = browser.find('.news-text').text[0...200]

    [image, title, text]
  end

browser.visit('https://onliner.by')
browser.all('a', text: 'АВТО').first.click
auto_links = browser.all('a', class: 'news-tiles__stub').find.map { |item| item['href'] }

auto_result =
  auto_links.map do |auto_link|
    browser.visit(auto_link)
    image = browser.find('div', class: 'news-header__image')['style'].scan(/https:.+\.jpeg/).first
    title = browser.find('h1').text
    text = browser.find('.news-text').text[0...200]

    [image, title, text]
  end

CSV.open('result.csv', 'w') do |csv|
  money_result.each do |row|
    csv << row
  end

  people_result.each do |row|
    csv << row
  end

  auto_result.each do |row|
    csv << row
  end
end
