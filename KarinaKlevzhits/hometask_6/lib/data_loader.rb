# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'
require 'net/http'
# class DataLoader
class DataLoader
  def initialize(url)
    @url = url
  end

  def call
    uri = URI(url)
    res = Net::HTTP.get(uri) # => String
    File.delete('./file.xml') if File.exist?('./file.xml')
    open('./file.xml', 'w') do |file|
      file.write(res)
    end
  end

  private

  attr_accessor :url
end
