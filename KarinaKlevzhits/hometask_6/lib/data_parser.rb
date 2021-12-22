# frozen_string_literal: true

require 'nokogiri'

# class DataParser
class DataParser
  def initialize
    @data = Nokogiri::XML(File.open('file.xml'))
  end

  def call
    result = []
    data.xpath('//*[@time]').each do |link|
      link.search('Cube').each do |inner_link|
        result.push(result_row(link['time'], inner_link['currency'], inner_link['rate']))
      end
    end
    result
  end

  private

  attr_accessor :data

  def result_row(time, currency, rate)
    { time: time, currency: currency, rate: rate }
  end
end
