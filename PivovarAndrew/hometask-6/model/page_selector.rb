# !/usr/bin/env ruby
# frozen_string_literal: true

# Class that describes selectors for a web page
class PageSelector
  attr_reader :section_selector, :title_selector, :image_url_selector, :text_selector

  def initialize(section_selector, title_selector, image_url_selector, text_selector)
    @section_selector = section_selector
    @title_selector = title_selector
    @image_url_selector = image_url_selector
    @text_selector = text_selector
  end
end
