# frozen_string_literal: true

require 'open-uri'
require 'nokogiri'
require 'ostruct'

module Deaths
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

    def html_document
      Nokogiri::HTML(content)
    end

    def rows
      begin
        data = html_document.xpath('/html/body/div[4]/div[3]/div[2]/main/div[3]/div[2]/div[1]').css('aside').xpath('div[11]/div')
      rescue TypeError => e
        return OpenStruct.new(success?: false, error_message: NO_CHARACTER_MESSAGE, data: '')
      end
      OpenStruct.new(success?: true, error_message: '', data: data)
    end
  end
end
