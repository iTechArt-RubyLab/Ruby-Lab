# frozen_string_literal: true

require 'benchmark'
require './my_array_rotate'

puts '100'

Benchmark.bm do |x|
  x.report { (1..1_000_000).to_a.lab_rotate(999_999) }
  x.report { (1..1_000_000).to_a.lab_rotate(999_999) }
  x.report { (1..1_000_000).to_a.lab_rotate(999_999) }
  x.report { (1..1_000_000).to_a.lab_rotate(999_999) }
  x.report { (1..1_000_000).to_a.lab_rotate(999_999) }
  x.report { (1..1_000_000).to_a.lab_rotate(999_999) }

  puts '1000'

  x.report { (1..1_000_000).to_a.rotate!(999_999) }
  x.report { (1..1_000_000).to_a.rotate!(999_999) }
  x.report { (1..1_000_000).to_a.rotate!(999_999) }
  x.report { (1..1_000_000).to_a.rotate!(999_999) }
  x.report { (1..1_000_000).to_a.rotate!(999_999) }
  x.report { (1..1_000_000).to_a.rotate!(999_999) }

  puts '1000'

  # x.report { (1..1000).to_a.lab_rotate(999999) }
  # x.report { (1..1000).to_a.rotate(999999) }
  # x.report { (1..1000).to_a.lab_rotate(91) }
  # x.report { (1..1000).to_a.rotate(91) }
  # x.report { (1..1000).to_a.lab_rotate(232) }
  # x.report { (1..1000).to_a.rotate(232) }

  # puts '1000 !'
  #
  # x.report { (1..1000).to_a.lab_rotate!(10) }
  # x.report { (1..1000).to_a.rotate!(10) }
  # x.report { (1..1000).to_a.lab_rotate!(91) }
  # x.report { (1..1000).to_a.rotate!(91) }
  # x.report { (1..1000).to_a.lab_rotate!(232) }
  # x.report { (1..1000).to_a.rotate!(232) }
end
