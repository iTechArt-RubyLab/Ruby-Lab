# frozen_string_literal: true

# Onliner chapter xpath
class OnlinerChapter
  attr_reader :chapter_xpath

  def initialize(chapter_xpath)
    @chapter_xpath = chapter_xpath
  end

  def csv(reference_element, level, csv_mode)
    CSV.open('onliner.csv', csv_mode) do |csv|
      within_container(chapter_xpath, reference_element, csv, level)
    end
  end

  private

  def within_container(container_xpath, reference_element, csv, level_number)
    Capybara.within(:xpath, container_xpath) do
      index = 0
      Capybara.page.all(reference_element).each do |reference_point|
        index += 1
        csv << titel(reference_point, "title_#{index}", level_number)
        csv << element_text(reference_point, "text_#{index}", level_number)
        csv << image_sources(reference_point, "image_src#{index}")
      end
    end
  end

  def element_text(reference_point, title_row, level_number)
    picture_parents = parents(reference_point, "./#{parent_level(level_number)}")
    return [title_row, parents(reference_point, "./#{level}/..")[0].text] if picture_parents[0].all('a').empty?

    [title_row, picture_parents[0].text]
  end

  def parents(element, xpath)
    element.all(:xpath, xpath)
  end

  def image_sources(element, title_row)
    [title_row, element.find('img')['src']]
  end

  def titel(reference_point, title_row, level_number)
    picture_parents = parents(reference_point, "./#{parent_level(level_number)}")
    if picture_parents[0].text.empty?
      return [title_row,
              parents(reference_point, "./#{level}/..")[0].text.split("\n")[0]]
    end

    [title_row, picture_parents[0].text.split("\n")[0]]
  end

  def parent_level(level_number)
    '/..' * level_number
  end
end
