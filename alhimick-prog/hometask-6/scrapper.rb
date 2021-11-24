#!/usr/bin/env ruby
# frozen_string_literal: true

require 'capybara'
require 'capybara/dsl'
require 'rspec'

RSpec.describe 'Onliner' do
  it 'start page of onliner' do
    visit 'https://www.onliner.by/'
    expect(page).to have_content('каталог')
  end
end
