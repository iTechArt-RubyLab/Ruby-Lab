# !/usr/bin/env ruby
# frozen_string_literal: true

require 'benchmark'
require 'my_array_rotate'

HOW_TIMES_MASSIVE = [1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1_024, 2_048,
                     4_096, 8_192, 16_384, 32_768, 65_536, 131_072, 262_144,
                     524_288, 1_048_576].freeze
