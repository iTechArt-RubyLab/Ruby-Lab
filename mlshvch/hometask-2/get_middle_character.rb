# frozen_string_literal: true

def get_middle(string)
  len = string.length
  mid = len / 2
  len.even? == true ? string[mid - 1, mid] : string[mid]
end

def run_cli
  loop do
    puts 'Enter string: '
    input = gets.chomp
    break if input == 'exit!'

    if input.empty? == true
      puts 'String can not be blank!'
    else
      puts "Middle character: #{get_middle(input)}"
    end
  end
end

run_cli
