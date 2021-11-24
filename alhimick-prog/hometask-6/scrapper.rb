#!/usr/bin/env ruby
# frozen_string_literal: true

require 'capybara'
require 'capybara/dsl'
require 'capybara/rspec'
require 'rspec'
require 'cucumber'
require 'selenium-webdriver'

RSpec.describe 'Onliner' do
  it 'start page of onliner' do
    visit 'https://www.onliner.by/'
    expect(page).to have_content('whatineed')
  end
end
