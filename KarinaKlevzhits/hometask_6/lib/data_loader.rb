# frozen_string_literal: true

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
    open('./file.xml', 'w') do |file|
      file.write(res)
    end
  end

  private

  attr_accessor :url
end
