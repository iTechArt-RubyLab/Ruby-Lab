# frozen_string_literal: true

class Messenger
  def self.print_city_alert
    puts 'Input city name:'
  end

  def self.print_result_mean(mean)
    puts "Rainfall mean:#{mean}"
  end

  def self.print_empty_alert
    puts 'City can not be blank!'
  end

  def self.print_result_variance(variance)
    puts "Rainfall variance:#{variance}"
  end
end
