# frozen_string_literal: true

require 'rspec'
require 'capybara/rspec'
require 'pry'

Capybara.default_driver = :selenium_chrome
Capybara.app_host = 'https://www.onliner.by'

RSpec.configure do |config|
  config.include Capybara::DSL
end

RSpec.describe 'onliner ' do
  it 'visit page' do
    visit('/')
    expect(page).to have_current_path('/')
  end
end
