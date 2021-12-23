# frozen_string_literal: true

require 'http'
require 'json'
require_relative 'photo'

# Parsing data from API
class Parser
  URL = 'https://www.flickr.com/services/rest/'
  API_KEY = '70f15f7318fbf9da1a60112a77b45c02'
  SEARCH_METHOD = 'flickr.photos.search'
  GET_METHOD = 'flickr.photos.getInfo'
  FORMAT = 'format=json&nojsoncallback=1'

  def data_scrap(tag, count)
    result = []
    photos_search(tag, count).each do |photo|
      id, title = photo.values_at('id', 'title')
      owner, urls = get_info(id).values_at('owner', 'urls')
      result << Photo.new(id, owner['username'], title, urls['url'].first['_content'])
    end
    result
  end

  private

  def photos_search(tag, count)
    responce = HTTP.get("#{URL}?method=#{SEARCH_METHOD}&api_key=#{API_KEY}&tags=#{tag}&per_page=#{count}&#{FORMAT}")
    JSON.parse(responce)['photos']['photo']
  end

  def get_info(photo_id)
    responce = HTTP.get("#{URL}?method=#{GET_METHOD}&api_key=#{API_KEY}&photo_id=#{photo_id}&#{FORMAT}")
    JSON.parse(responce)['photo']
  end
end
