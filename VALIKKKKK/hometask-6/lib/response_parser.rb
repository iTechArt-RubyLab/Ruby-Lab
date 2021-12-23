# frozen_string_literal: true

require_relative 'car_data'
require_relative 'cars_data'

# Class parse the response and return the array of CarsData
class ResponseParser
  def initialize(response)
    @response = response
  end

  def call
    cars_data = CarsData.new
    @response['adverts'].each do |el|
      model = el['model']['name']
      year = el['specs']['year']
      price = el['price']['converted']['USD']['amount']
      city =  el['location']['city']['name']
      link = el['html_url']
      cars_data.cars << CarData.new(model: model, year: year, price: price, city: city, link: link)
    end
    cars_data
  end
end
