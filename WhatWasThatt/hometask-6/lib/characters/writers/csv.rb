# frozen_string_literal: true

require 'prawn'
require 'csv'

module Characters
  module Writers
    # service to create csv file with character name and link
    class Csv
      def initialize(name, hash)
        @name = name
        @hash = hash
      end

      def call
        CSV.open("#{name}.csv", 'wb') do |csv|
          hash.each do |character|
            csv << [character.first, character.last]
          end
        end
      end

      private

      attr_accessor :name, :hash
    end
  end
end
