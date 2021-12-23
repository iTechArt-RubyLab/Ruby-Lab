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
    @response['adverts'].each do |attrib|
      cars_data.cars << CarData.new(prepare_attributes(attrib))
    end
    cars_data
  end

  private

  def prepare_attributes(attributes)
    {
      model: attributes['model']['name'],
      year: attributes['specs']['year'],
      price: attributes['price']['converted']['USD']['amount'],
      city: attributes['location']['city']['name'],
      link: attributes['html_url']
    }
  end
end
