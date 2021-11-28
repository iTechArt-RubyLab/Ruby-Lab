# !/usr/bin/env ruby
# frozen_string_literal: true

require 'nokogiri'
require 'httparty'
require 'byebug'

def scraper
  url = 'https://www.onliner.by/'
  unparsed_page = HTTParty.get(url)
  parsed_page ||= Nokogiri::HTML(unparsed_page.body)
  lett = parsed_page.css('.b-tile.m-1x1.m-info')
  first_block = Array.new
  lett.each do |info_listing|
    info = {
      chapter: info_listing.css('a')[1].attributes["href"].text,
      info: info_listing.css('span.txt.line-clamp-4').text,
      url: info_listing.css('a')[0].attributes["href"].value

    }
first_block << info
  end
end
scraper
