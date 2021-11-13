# frozen_string_literal: true

class Rainfall
  def initialize
    @data = 'Rome:Jan 81.2,Feb 63.2,Mar 70.3,Apr 55.7,May 53.0,Jun 36.4,Jul 17.5,Aug 27.5,Sep 60.9,Oct 117.7,Nov 111.0,Dec 97.9' + "\n" \
            'London:Jan 48.0,Feb 38.9,Mar 39.9,Apr 42.2,May 47.3,Jun 52.1,Jul 59.5,Aug 57.2,Sep 55.4,Oct 62.0,Nov 59.0,Dec 52.9'

    @user_input = user_input
    @city_and_values = {}
  end

  def run_cli
    return if @user_input == 'exit!'

    if @user_input.empty?
      puts 'Mistake!!!'
    else
      p mean
      p variance
    end

    repeat
  end

  private

  def user_input
    puts 'Enter a string:'
    gets.chomp
  end

  def repeat
    @user_input = user_input

    run_cli
  end

  def mean
    a = @data.split("\n")
    a.each do |s|
      city = /\w+:/.match(s).to_s.delete(':')
      rainfall = s.scan(/([0-9-]+\.[0-9])/).flatten.map(&:to_f)
      @city_and_values[city] = rainfall
    end

    return -1 unless @city_and_values[@user_input]

    @city_and_values[@user_input].sum / 12

  end

  def variance
    avg = mean
    return -1 unless @city_and_values[@user_input]

    var = @city_and_values[@user_input].map { |x| (x - avg)**2 }
    var.sum / 12
  end
end

rr = Rainfall.new

rr.run_cli
