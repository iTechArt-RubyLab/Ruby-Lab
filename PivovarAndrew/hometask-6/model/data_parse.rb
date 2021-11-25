require "capybara"
require "selenium-webdriver"
require "csv"
require "./model/page_selector"

# Class responsible for scrap and import required information from the web site
class WebSiteScraper
  attr_reader :data, :web_site_info

  CSV_PATH = "./file/data.csv"
  MIN_TEXT_LENGTH = 0
  MAX_TEXT_LENGTH = 200

  def initialize(web_site_info)
    @web_site_info = web_site_info
    @data = []
    Capybara.ignore_hidden_elements = false
  end

  def scrap_web_site
    driver_setup
    Capybara.visit @web_site_info[:address]
    css_classes = @web_site_info[:css_classes]
    @data = scrap_section(PageSelector.new(
      css_classes[:section],
      css_classes[:h],
      css_classes[:img],
      css_classes[:p]
    ))
    self
  end

  def import_to_csv
    CSV.open(CSV_PATH, "wb") do |csv|
      csv << ["Title", "Image URL", "Text"]
      @data.each do |section|
        csv << [section[:title], section[:image_url], section[:text]]
      end
    end
  end

  private

  def scrap_section(page_selector)
    Capybara.all(page_selector.section_selector).reduce([]) do |memo, element|
      memo << {
        title: element.find(page_selector.title_selector)[:innerText],
        image_url: element.find(page_selector.image_url_selector)[:src],
        text: element.find(page_selector.text_selector)[:innerText][MIN_TEXT_LENGTH..MAX_TEXT_LENGTH],
      }
    end
  end

  def driver_setup
    Capybara.default_driver = :selenium
    Capybara.register_driver :selenium do |app|
      Capybara::Selenium::Driver.new(app, browser: :edge)
    end
  end
end
