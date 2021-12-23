# frozen_string_literal: true

module Deaths
  module Writers
    class Csv
      def initialize(name, death_info)
        @name = name
        @death_info = death_info
      end

      def call
        CSV.open("#{name}.csv", 'wb') do |csv|
          csv << [death_info]
        end
      end

      private

      attr_accessor :name, :death_info
    end
  end
end
