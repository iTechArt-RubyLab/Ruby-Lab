# frozen_string_literal: true

require_relative 'fetcher'
require_relative 'parser'
require_relative 'writers/csv'
require 'ostruct'

module Characters
  class Processor
    WRITING_ACTIONS = { csv: Characters::Writers::Csv }.freeze

    def initialize(format, file_name)
      @format = format
      @file_name = file_name
    end

    def call
      writing_action
      parsed_data
    end

    private

    attr_accessor :format, :file_name

    def writing_action
      action = WRITING_ACTIONS.fetch(format, nil)
      if action.nil?
        OpenStruct.new(success?: false, data: '')
      else
        file = action.new(file_name, parsed_data).call
        OpenStruct.new(success?: true, data: file)
      end
    end

    def data
      Characters::Fetcher.new.call
    end

    def parsed_data
      Characters::Parser.new(data).call
    end
  end
end
