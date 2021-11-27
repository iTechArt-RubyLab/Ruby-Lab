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
technology_links = browser.all('a', class: 'news-tiles__stub').map { |item| item['href'] }

technology_result =
  technology_links.map do |technology_link|
    browser.visit(technology_link)
    image = browser.find('div', class: 'news-header__image')['style'].scan(/https:.+\.jpeg/).first
    title =  browser.find('h1').text
    text = browser.find('.news-text').text[0...200]

    [image, title, text]
  end


#PEOPLE
browser.all('a', text: 'ЛЮДИ').first.click
people_links = browser.all('a', class: 'news-tiles__stub').map { |item| item['href'] }

people_result =
  people_links.map do |people_link|
    browser.visit(people_link)
    image = browser.find('div', class: 'news-header__image')['style'].scan(/https:.+\.jpeg/).first
    title =  browser.find('h1').text
    text = browser.find('.news-text').text[0...200]

    [image, title, text]
  end

p people_result

# titles = browser.all('div', class: 'news-tiles__subtitle').map(&:text)
# pictures = browser.all('div', class: 'news-tiles__image').map { |item| item['style'].scan(/https:.+\.jpeg/).first }
# texts = []

# binding.pry
# browser.all('a', class: 'news-tiles__stub').each do |link|
#   link.click
#   texts << browser.find('.news-entry__speech').text[0...200]
# end

# p texts

# #CATALOG
# browser.find('a', text: 'КАТАЛОГ').click
# sleep 5

# titles = browser.all('a', class: 'b-tile-main').map(&:text)
# images = browser.all('picture img').map { |image| image['src'] }

# links = browser.all('a', class: 'b-tile-main')


# #PEOPLE
# browser.find('a', text: 'ЛЮДИ').click

# titles = browser.all('div', class: 'news-tiles__subtitle').map(&:text)
# images = browser.all('div', class: 'news-tiles__image').map { |item| item['style'].scan(/https:.+\.jpeg/).first }


# people_links = browser.all('a', class: 'news-tiles__stub')

# puts titles
# puts images