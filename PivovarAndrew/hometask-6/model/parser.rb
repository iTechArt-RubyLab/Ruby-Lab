# !/usr/bin/env ruby
# frozen_string_literal: true

require './model/scrapper/'

# Class responsible for the parse element
class Parser
  attr_reader :element

  def initialize(element)
    @element = element
  end

  # Class responsible for the parse title from selector
  class TitleParser < self
    attr_reader :title_selector

    def initialize(element, title_selector)
      super(element)
      @title_selector = title_selector
    end

    def parse_title
      element.find(title_selector)[:innerText]
    end
  end

  # Class responsible for the parse image from selector
  class ImageParser < self
    attr_reader :image_url_selector

    def initialize(element, image_url_selector)
      super(element)
      @image_url_selector = image_url_selector
    end

    def parse_image
      element.find(image_url_selector)[:src]
    end
  end

  # Class responsible for the parse text from selector
  class TextParser < self
    attr_reader :text_selector

    MIN_TEXT_LENGTH = 0
    MAX_TEXT_LENGTH = 200

    def initialize(element, text_selector)
      super(element)
      @text_selector = text_selector
    end

    def parse_text
      element.find(text_selector)[:innerText][MIN_TEXT_LENGTH..MAX_TEXT_LENGTH]
    end
  end
end
