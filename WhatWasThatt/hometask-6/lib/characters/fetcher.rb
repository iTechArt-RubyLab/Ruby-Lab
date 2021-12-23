# frozen_string_literal: true

require 'open-uri'
require 'nokogiri'

module Characters
  # service to fetch characters data from page
  class Fetcher
    def call
      rows
    end

    private

    MAIN_PAGE = 'https://gameofthrones.fandom.com/wiki/Game_of_Thrones_Wiki'

    def content
      URI.parse(MAIN_PAGE).open.read
    end

    def html_document
      Nokogiri::HTML(content)
    end

    def table
      html_document.xpath('//div[3]/div/div/div[2]/div/table[3]')
    end

    def rows
      table.css('tr td tbody tr td table tbody tr td')
    end
  end
end
