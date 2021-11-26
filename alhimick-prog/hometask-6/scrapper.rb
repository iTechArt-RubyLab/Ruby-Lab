#!/usr/bin/env ruby
# frozen_string_literal: true

require 'capybara'
require 'capybara/dsl'
require 'capybara/rspec'
require 'capybara/mechanize'
require 'rspec'
require 'cucumber'
require 'selenium-webdriver'

=begin
Capybara.default_driver = :selenium
Capybara.default_driver = :webkit
Capybara.run_server = false
Capybara.current_driver = :selenium
caps = Selenium::WebDriver::Remote::Capabilities.chrome
caps.page_load_strategy = 'normal'
Capybara.app_host = 'https://www.onliner.by/'

Capybara.register_driver :mechanize do |app|
  Capybara::Mechanize::Driver.new(proc {})
end
session = Capybara::Session.new :mechanize
session.visit 'https://www.onliner.by/'
=end
class OpenOnliner
  include Capybara::DSL
  Capybara.register_driver :mechanize do |app|
    Capybara::Mechanize::Driver.new(proc {})
  end
  session = Capybara::Session.new :mechanize
  session.visit('https://www.onliner.by/')

end

test = OpenOnliner.new
puts test
puts test.page

#visit('https://www.onliner.by/')
=begin
RSpec.describe 'Onliner' do
  it 'start page of onliner' do
    visit 'https://www.onliner.by/'
    expect(page).to have_content('whatineed')
  end
=end
