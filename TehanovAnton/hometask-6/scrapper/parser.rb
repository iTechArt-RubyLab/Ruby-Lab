# frozen_string_literal: true

# Site parser
class Parser
  include Capybara::DSL
  attr_reader :chapter_xpath, :site_config

  Capybara.default_driver = :selenium_chrome

  def initialize(site_config)
    @site_config = site_config
    Capybara.app_host = site_config['host']
  end

  def parse
    parse_site.flatten(1)
  end

  private

  def parse_site
    site_config['sections'].map do |name, config|
      visit(config['path'])
      parse_section(name, config)
    end
  end

  def parse_section(name, config)
    within(config['location']) do
      tag_name = config['tag_name']
      tag_class = config['tag_class']

      return page.all(tag_name, class: tag_class).map do |element|
        data_row(name, config, element)
      end
    end
  end

  def data_row(name, config, element)
    [
      name,
      element.find(config['title_location']).text,
      element.text,
      link(element),
      image_source(element)
    ]
  end

  def title(element)
    element.text.split("\n").first
  end

  def link(element)
    element.all('a').last['href']
  end

  def image_source(element)
    image = element.all('img').first
    image ? image['src'] : ''
  end
end
