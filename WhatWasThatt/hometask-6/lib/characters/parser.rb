# frozen_string_literal: true

require 'nokogiri'

module Characters
  # service to get hash with name and link of each character
  class Parser
    def initialize(rows)
      @rows = rows
    end

    def call
      chars_hash = {}
      rows.each do |row|
        name = row.css('a').first.attributes['title'].value
        link = row.css('a').first.attributes['href'].value
        full_link = "https://gameofthrones.fandom.com/#{link}"
        chars_hash[name] = full_link
      end
      chars_hash
    end

    private

    attr_accessor :rows
  end
end
