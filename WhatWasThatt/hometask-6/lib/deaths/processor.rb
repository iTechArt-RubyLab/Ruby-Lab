# frozen_string_literal: true

require_relative 'fetcher'
require_relative 'parser'
require_relative 'writers/csv'

module Deaths
  class Processor
    WRITING_ACTIONS = { csv: Deaths::Writers::Csv }.freeze

    def initialize(characters_hash, character_name, format, file_name)
      @characters_hash = characters_hash
      @character_name = character_name
      @format = format
      @file_name = file_name
    end

    def call
      if death_data.success?
        writing_action
        dead? ? death_info : alive
      else
        error_message
      end
    end

    private

    attr_accessor :characters_hash, :character_name, :format, :file_name

    def writing_action
      action = WRITING_ACTIONS.fetch(format, nil)
      if action.nil?
        OpenStruct.new(success?: false, data: '')
      else
        file = action.new(file_name, death_info).call
        OpenStruct.new(success?: true, data: file)
      end
    end

    def dead?
      death_info.include? 'AC'
    end

    def error_message
      puts(death_data.error_message)
    end

    def character_page
      characters_hash[character_name]
    end

    def death_data
      Deaths::Fetcher.new(character_page).call
    end

    def death_info
      Deaths::Parser.new(death_data.data).call
    end

    def alive
      'Character is alive'
    end
  end
end
