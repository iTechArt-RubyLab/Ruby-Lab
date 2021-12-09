# frozen_string_literal: true

require_relative 'config'

require_relative 'constants'

require 'csv'

page = Config.new.config(ONLINER)

doc = Nokogiri::HTML(page)

# все ссылки на новости

main_news =

  doc.xpath(MAIN_NEWS_ONE).map(&:value),
  doc.xpath(MAIN_NEWS_TWO).map(&:value),
  doc.xpath(MAIN_NEWS_THREE).map(&:value),
  doc.xpath(MAIN_NEWS_FOUR).map(&:value)

catalog = doc.xpath(CATALOG).map(&:value)

money = doc.xpath(MONEY).map(&:value)

CSV.open('file.csv', 'wb') do |csv|
  # забрать название новости, картинки и текст

  csv << %w[title text image]

  # переходим по ссылке на новость
  [main_news, catalog, money].flatten.each do |link|
    html = Nokogiri::HTML(Config.new.config(link))

    title = html.xpath(TITLE).to_s # название новости

    text = html.xpath(TEXT)[0]&.text()
    text = text ? text[0, 200] : ''

    image = html.xpath(IMAGE)[0]&.value
    image = image ? image.scan(REGEX_FOR_LINK) : ''

    csv << [title, text, image]
  end
end
