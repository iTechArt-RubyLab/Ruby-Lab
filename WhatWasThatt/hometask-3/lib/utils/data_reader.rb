# frozen_string_literal: true

require 'ostruct'

# Data processing module
module Utils
  # Class to read info from file
  class DataReader
    def initialize(path)
      @path = path
    end

    def call
      begin
        data = File.open(path).read
      rescue StandardError => e
        return OpenStruct.new(success?: false, error_message: e.message, data: '')
      end
      OpenStruct.new(success?: true, error_message: '', data: data)
    end

    private

    attr_accessor :path
  end
end
