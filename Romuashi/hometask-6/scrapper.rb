#!/usr/bin/env ruby
# frozen_string_literal: true

require 'httparty'
require 'nokogiri'

class Scraper
  DEFAULT_OPTIONS = {
    base_url: 'https://www.onliner.by/',
    path: 'listing',
    param: 'page',
    parent: {
      element: 'div',
      name: 'listing_block',
      type: 'class'
    },
    targets: [
      { key: :title, element: 'div', name: 'b-title', config: :class },
      { key: :company, element: 'div', name: 'item_tag', config: :class },
      { key: :location, element: 'div', name: 'location', config: :class },
      { key: :url, element: 'a', name: nil, type: :href }
    ]
  }.freeze

  attr_accessor :options, :results

  def initialize
    @options = DEFAULT_OPTIONS
    @results = []
  end

  def attribute_type(type)
    type == :class ? '.' : '#'
  end

  # Set the parent element for nokogiri parsing
  # ex: 'div.listingCard'
  def parent_target
    parent = @options[:parent]

    return parent[:element] if parent[:name].nil? || parent[:type].nil?

    attribute_type = attribute_type(parent[:type])

    [parent[:element], attribute_type, parent[:name]].join
  end

  def scrape_page(url)
    Nokogiri::HTML(HTTParty.get(url))
  end

  def format_results(page_items)
    page_items.each { |page_item| @results << format_result(page_item) }
  end

  def format_result(page_item)
    @options[:targets].each_with_object({}) do |t, obj|
      next obj[t[:key]] = get_href_value(page_item) if t[:type] == :href

      type = attribute_type(t[:type])
      value = [t[:element], type, t[:name]]

      obj[t[:key]] = page_item.css(value)
    end
  end

  def get_href_value(page_item)
    page_item.css('a')[0].attributes['href'].value
  end
end
