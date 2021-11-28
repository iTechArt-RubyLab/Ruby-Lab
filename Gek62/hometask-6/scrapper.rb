# frozen_string_literal: true

require 'watir'
require 'webdrivers'
require 'nokogiri'
require 'csv'

browser = Watir::Browser.new
browser.goto 'https://onliner.by'
parsed_page = Nokogiri::HTML(browser.html)

File.open('parsed.txt', 'w') { |f| f.write parsed_page.to_s }

browser.close

CSV.open('mainblock.csv', 'a+') do |csv|
  csv << %w[title link picture_link]

  article_cards = parsed_page.xpath("//*[@id='container']/div/div/div/div/div[2]")
  article_cards.each do |card|
    title = card.xpath('//a/h3/span').text
    link = card.xpath('//@href')
    picture = card.xpath('//*[@id]/div/picture')

    csv << [title, link, picture]
  end
end

browser = Watir::Browser.new
browser.goto 'https://catalog.onliner.by'
parsed_page = Nokogiri::HTML(browser.html)

File.open('parsed.txt', 'w') { |f| f.write parsed_page.to_s }

browser.close

CSV.open('catalog.csv', 'a+') do |csv|
  csv << %w[title link picture_link]

  article_cards = parsed_page.xpath("//*[@id='container']/div/div/div/div/div[4]")
  article_cards.each do |card|
    title = card.xpath("//*[@id='container']/div/div/div/div/div/div/div/h3").text
    link = card.xpath("//*[@id='container']/div/div/div/div/div[2]/div[1]/div[1]/div[1]/@href")
    picture = card.xpath('//div/picture/img/@src')

    csv << [title, link, picture]
  end
end

browser = Watir::Browser.new
browser.goto 'https://money.onliner.by'
parsed_page = Nokogiri::HTML(browser.html)

File.open('parsed.txt', 'w') { |f| f.write parsed_page.to_s }

browser.close

CSV.open('money.csv', 'a+') do |csv|
  csv << %w[title link picture_link]

  article_cards = parsed_page.xpath("//*[@id='container']/div/div/div/div/div[4]")
  article_cards.each do |card|
    title = card.xpath("//*[@id='container']/div/div/div/div/div/div/div/h3").text
    link = card.xpath("//*[@id='container']/div/div/div/div/div[2]/div[1]/div[1]/div[1]/@href")
    picture = card.xpath('//div/picture/img/@src')

    csv << [title, link, picture]
  end
end
