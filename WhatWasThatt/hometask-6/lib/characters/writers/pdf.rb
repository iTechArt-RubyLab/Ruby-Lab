# frozen_string_literal: true

module Writers
  class Pdf
    def initialize(name, hash)
      @name = name
      @hash = hash
    end

    def call
      p hash['Daenerys Targaryen'].to_s
      Prawn::Document.generate("#{name}.pdf") do
        text hash['Daenerys Targaryen'].to_s
      end
    end

    private

    attr_accessor :name, :hash
  end
end
