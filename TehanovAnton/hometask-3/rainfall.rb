#!/usr/bin/env ruby
# frozen_string_literal: true

require './rainfall_cli'

def run_cli
  RainfallCli.new.run_cli
end

run_cli
