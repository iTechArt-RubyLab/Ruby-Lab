#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'rainfall_cli'

def run_cli
  RainfallCli.new('rainfall_data').run_cli
end

run_cli
