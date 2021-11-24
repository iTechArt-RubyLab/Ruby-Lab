#!/usr/bin/env ruby
# frozen_string_literal: true

require 'rspec'
require 'capybara/rspec'
require 'pry'
require 'csv'
require 'capybara'
require 'capybara/dsl'

Capybara.default_driver = :selenium_chrome
Capybara.app_host = 'https://www.onliner.by'

RSpec.configure do |config|
  config.include Capybara::DSL
end

RSpec.describe 'onliner ' do
  it 'scribes news images' do
    visit('/')
    expect(page).to have_current_path('/')
    csv = CSV.open('file.csv', 'ab')
    within(:xpath, '/html/body/div[1]/div/div/div/div/div/div[2]/div[1]') do
      page.all('img').each do |img|
        csv << [img['src']]
      end
    end
    csv.close
  end

  it 'scribes news titles' do
    visit('/')
    expect(page).to have_current_path('/')
    csv = CSV.open('file.csv', 'ab')
    within(:xpath, '/html/body/div[1]/div/div/div/div/div/div[2]/div[1]') do
      page.all('h3', class: 'b-tile-header').each do |header|
        csv << [header.text]
      end
    end
    csv.close
  end

  it 'scribes peoples images' do
    visit('/')
    expect(page).to have_current_path('/')
    csv = CSV.open('file.csv', 'ab')
    within(:xpath, '/html/body/div[1]/div/div/div/div/div/div[7]/ul') do
      page.all('img').each do |img|
        csv << [img['src']]
      end
    end
    csv.close
  end

  it 'scribes peoples titles' do
    visit('/')
    expect(page).to have_current_path('/')
    csv = CSV.open('file.csv', 'ab')
    within(:xpath, '/html/body/div[1]/div/div/div/div/div/div[7]/ul') do
      page.all('div', class: 'b-opinions-main-2__text').each do |header|
        csv << [header.text]
      end
    end
    csv.close
  end

  it 'scribes catalog images' do
    visit('/')
    expect(page).to have_current_path('/')
    csv = CSV.open('file.csv', 'ab')
    within(:xpath, '/html/body/div[1]/div/div/div/div/div/div[4]/div[2]/div/div[1]') do
      page.all('img').each do |img|
        csv << [img['src']]
      end
    end
    csv.close
  end

  it 'scribes catalog titles' do
    visit('/')
    expect(page).to have_current_path('/')
    csv = CSV.open('file.csv', 'ab')
    within(:xpath, '/html/body/div[1]/div/div/div/div/div/div[4]/div[2]/div/div[1]') do
      page.all('div', class: 'catalog-offers__title').each do |title|
        csv << [title.text]
      end
    end
    csv.close
  end
end
