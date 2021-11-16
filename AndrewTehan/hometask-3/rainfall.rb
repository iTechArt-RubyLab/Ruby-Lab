#!/usr/bin/env ruby
# frozen_string_literal: true

require './cli'
require './rainfall_statistics'

def run
  Cli.new.run
end

run
