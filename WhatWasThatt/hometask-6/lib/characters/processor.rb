# frozen_string_literal: true

require_relative 'fetcher'
require_relative 'parser'
require_relative 'writers/csv'
require 'ostruct'

module Characters
  class Processor
    WRITING_ACTIONS = { csv: Writers::Csv }.freeze

    def initialize(format, file_name)
      @format = format
      @file_name = file_name
    end

    def call
      writing_action = WRITING_ACTIONS.fetch(format, nil)
      if writing_action.nil?
        OpenStruct.new(success?: false, file_name: '')
      else
        file = writing_action.new(file_name, parsed_data).call
        OpenStruct.new(success?: true, file_name: file)
      end
    end

    private

    attr_accessor :format, :file_name

    def data
      Characters::Fetcher.new.call
    end

    def parsed_data
      Characters::Parser.new(data).call
    end
  end
end
