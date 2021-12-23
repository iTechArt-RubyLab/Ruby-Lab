# frozen_string_literal: true

require 'nokogiri'

module Deaths
  class Parser
    def initialize(character_data)
      @character_data = character_data
    end

    def call
      death_data
    end

    private

    attr_accessor :character_data

    def death_data
      character_data.inner_text
    end
  end
end
