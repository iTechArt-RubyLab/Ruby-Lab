# frozen_string_literal: true

require_relative 'config'

require_relative 'constants'

require 'csv'

page = Config.new.config(ONLINER)

doc = Nokogiri::HTML(page)

# все ссылки на новости

main_news_links =

  doc.xpath(XPATH_FIRST_BLOCK_ONE).map(&:value),
  doc.xpath(XPATH_FIRST_BLOCK_TWO).map(&:value),
  doc.xpath(XPATH_FIRST_BLOCK_THREE).map(&:value),
  doc.xpath(XPATH_FIRST_BLOCK_FOUR).map(&:value)

second_block_links = doc.xpath(XPATH_SECOND_BLOCK).map(&:value)

third_block_links = doc.xpath(XPATH_THIRD_BLOCK).map(&:value)

CSV.open('file.csv', 'wb') do |csv|
  # забрать название новости, картинки и текст

  csv << %w[title text image]

  # переходим по ссылке на новость
  [main_news_links, second_block_links, third_block_links].flatten.each do |link|
    html_for_links = Nokogiri::HTML(Config.new.config(link))

    title = html_for_links.xpath(TITLE).to_s # название новости

    text = html_for_links.xpath(TEXT)[0]&.text()
    text = text ? text[0, 200] : ''

    image = html_for_links.xpath(IMAGE)[0]&.value
    image = image ? image.scan(REGEX_FOR_LINK) : ''

    csv << [title, text, image]
  end
end
