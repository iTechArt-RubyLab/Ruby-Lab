# frozen_string_literal: true

require 'capybara'
require 'capybara/dsl'

module Scrapper
  # this class is used to pasring site
  class Parser
    include Capybara::DSL

    attr_reader :results

    def initialize(site)
      load_rule(site)

      Capybara.default_driver = :selenium_chrome
      Capybara.app_host = @rule['url']

      @results = []
    end

    def call
      Capybara.visit('/')

      parse('people')
      parse('catalog')

      results
    end

    private

    attr_writer :results, :site

    def load_rule(site)
      @rule = YAML.safe_load(File.read("./scrapper/rules/#{site}.yml"))
    end

    def parse(section)
      within(@rule['sections'][section]['location']) do
        page.all(@rule['sections'][section]['item_tag'],
                 class: @rule['sections'][section]['item_class']).each do |element|
          res = [section.capitalize]
          res << element.find((@rule['sections'][section]['title_location']).to_s).text
          res << element.find('img')['src']
          results << res
        end
      end
    end
  end
end
