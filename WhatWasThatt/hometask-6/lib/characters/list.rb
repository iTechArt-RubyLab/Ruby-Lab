module Characters
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