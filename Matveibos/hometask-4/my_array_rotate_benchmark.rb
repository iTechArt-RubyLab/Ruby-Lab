# frozen_string_literal: true

require 'benchmark'
require './my_array_rotate'

Benchmark.bm do |x|
  puts 'lab rotate/rotate'

  x.report { (1..1_000_000).to_a.lab_rotate(999_999) }
  x.report { (1..1_000_000).to_a.rotate(999_999) }
  x.report { (1..1_000_000).to_a.lab_rotate(999_999) }
  x.report { (1..1_000_000).to_a.rotate(999_999) }
  x.report { (1..1_000_000).to_a.lab_rotate(999_999) }
  x.report { (1..1_000_000).to_a.rotate(999_999) }

  puts 'lab rotate!/rotate!'

  x.report { (1..1_000_000).to_a.lab_rotate!(999_999) }
  x.report { (1..1_000_000).to_a.rotate!(999_999) }
  x.report { (1..1_000_000).to_a.lab_rotate!(999_999) }
  x.report { (1..1_000_000).to_a.rotate!(999_999) }
  x.report { (1..1_000_000).to_a.lab_rotate!(999_999) }
  x.report { (1..1_000_000).to_a.rotate!(999_999) }

  puts '1000'
end
