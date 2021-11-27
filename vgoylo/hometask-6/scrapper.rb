require 'selenium-webdriver'
require 'nokogiri'
require 'capybara'
require 'pry'

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
driver = browser.driver.browser


browser.visit('https://onliner.by')

#TEHNOLOGY
browser.all('a', text: 'ТЕХНОЛОГИИ').first.click

titles = browser.all('div', class: 'news-tiles__subtitle').map(&:text)
pictures = browser.all('div', class: 'news-tiles__image').map { |item| item['style'].scan(/https:.+\.jpeg/).first }

links = browser.all('div', class: 'news-tiles__subtitle')


#CATALOG
browser.find('a', text: 'КАТАЛОГ').click
sleep 5

titles = browser.all('a', class: 'b-tile-main').map(&:text)
images = browser.all('picture img').map { |image| image['src'] }

links = browser.all('a', class: 'b-tile-main')


#PEOPLE
browser.find('a', text: 'ЛЮДИ').click

titles = browser.all('div', class: 'news-tiles__subtitle').map(&:text)
images = browser.all('div', class: 'news-tiles__image').map { |item| item['style'].scan(/https:.+\.jpeg/).first }


people_links = browser.all('a', class: 'news-tiles__stub')

puts titles
puts images