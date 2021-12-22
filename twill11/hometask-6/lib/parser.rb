# frozen_string_literal: true

require 'http'
require 'json'
require_relative 'photo'

# Parsing data from API
class Parser
  URL = 'https://www.flickr.com/services/rest/'
  API_KEY = '5d54f2b42d120b834e3944afe7281069'
  SEARCH_METHOD = 'flickr.photos.search'
  GET_METHOD = 'flickr.photos.getInfo'
  FORMAT = 'format=json&nojsoncallback=1'

  def data_scrap(tag, count)
    result = []
    photos_search(tag, count).each do |photo|
      id, title = photo.values_at('id', 'title')
      owner, urls = get_info(id).values_at('owner', 'urls')
      result << photo_dataset(Photo.new(id, title, owner['username'], urls['url'].first['_content']))
    end
    result
  end

  private

  def photo_dataset(photo)
    [photo.photo_id, photo.photo_title, photo.user_name, photo.image_link]
  end

  def photos_search(tag, count)
    responce = HTTP.get("#{URL}?method=#{SEARCH_METHOD}&api_key=#{API_KEY}&tags=#{tag}&per_page=#{count}&#{FORMAT}")
    JSON.parse(responce)['photos']['photo']
  end

  def get_info(photo_id)
    responce = HTTP.get("#{URL}?method=#{GET_METHOD}&api_key=#{API_KEY}&photo_id=#{photo_id}&#{FORMAT}")
    JSON.parse(responce)['photo']
  end
end
