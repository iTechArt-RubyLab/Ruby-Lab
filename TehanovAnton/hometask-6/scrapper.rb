# frozen_string_literal: true

require 'rspec'
require 'capybara/rspec'
require 'pry'
require 'csv'
require_relative 'onliner_chapter'

Capybara.default_driver = :selenium_chrome
Capybara.app_host = 'https://www.onliner.by'

RSpec.configure do |config|
  config.include Capybara::DSL
end

RSpec.describe 'onliner ' do
  let(:onliner_news) { OnlinerChapter.new('/html/body/div[1]/div/div/div/div/div/div[2]/div[1]') }
  let(:onliner_catalog) { OnlinerChapter.new('/html/body/div[1]/div/div/div/div/div/div[4]/div[2]/div/div[1]') }
  let(:onliner_people) { OnlinerChapter.new('/html/body/div[1]/div/div/div/div/div/div[7]/ul') }

  it 'visit page' do
    visit('/')
    onliner_news.csv('picture', 2, 'w')
    onliner_catalog.csv('picture', 3, 'ab')
    onliner_people.csv('picture', 1, 'ab')
  end
end
