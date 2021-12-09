# frozen_string_literal: true

require 'capybara'
require 'capybara/dsl'

module Scrapper
  # this class is used to pasring site
  class Parser
    include Capybara::DSL

    def initialize(site)
      load_rule(site)

      Capybara.default_driver = :selenium_chrome
      Capybara.app_host = rule['url']
    end

    def call
      Capybara.visit('/')
      parse_page
    end

    private

    attr_writer :results, :site
    attr_reader :rule

    def load_rule(site)
      @rule = YAML.safe_load(File.read("./scrapper/rules/#{site}.yml"))
    end

    def parse_page
      rule['sections'].map { |section| parse(*section) }.flatten(1)
    end

    def parse(section_name, section_config)
      within(section_config['location']) do
        page.all(section_config['item_tag'], class: section_config['item_class']).map do |element|
          generate_result(element, section_name, section_config)
        end
      end
    end

    def generate_result(element, section_name, section_config)
      res = [section_name.upcase]
      res << element.find(section_config['title_location']).text
      res << element.find(section_config['symbols']).text[0...200]
      res << element.find('img')['src']
    end
  end
end
