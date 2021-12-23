# frozen_string_literal: true

module Characters
  # service to create array of characters names
  class List
    def initialize(characters_hash)
      @characters_hash = characters_hash
    end

    def call
      characters_list
    end

    private

    attr_accessor :characters_hash

    def characters_list
      characters_hash.keys
    end
  end
end
