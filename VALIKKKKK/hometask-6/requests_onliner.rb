# frozen_string_literal: true

require_relative './lib/file_writer'
require_relative './lib/data_fetcher'

# Entry point class
class RequestsOnliner
  def self.call
    FileWriter.new(DataFetcher.new.call).call
  end
end

RequestsOnliner.call
