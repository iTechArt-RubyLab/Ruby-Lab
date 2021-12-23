# frozen_string_literal: true

require 'open-uri'
require 'nokogiri'
require 'ostruct'

module Deaths
  # service to get correct data from character page
  class Fetcher
    def initialize(page)
      @page = page
    end

    def call
      rows
    end

    private

    attr_accessor :page

    NO_CHARACTER_MESSAGE = 'no such character'

    def content
      URI.open(page).read
    end

    def doc
      Nokogiri::HTML(content)
    end

    def rows
      begin
        data = doc.xpath('/html/body/div[4]/div[3]/div[2]/main/div[3]/div[2]/div[1]').css('aside').xpath('div[11]/div')
      rescue StandardError
        return OpenStruct.new(success?: false, error_message: NO_CHARACTER_MESSAGE, data: '')
      end
      OpenStruct.new(success?: true, error_message: '', data: data)
    end
  end
end
