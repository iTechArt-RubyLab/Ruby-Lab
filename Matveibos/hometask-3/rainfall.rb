#!/usr/bin/env ruby
# frozen_string_literal: true

require './cli'
require './rainfall_stat'

def run_cli
  Cli.new.run_cli
end

run_cli
