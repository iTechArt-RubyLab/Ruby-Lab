# frozen_string_literal: true

def get_middle(string)
  middle_string_position = string.length / 2
  string.length.even? ? string[(middle_string_position - 1)..middle_string_position] : string[middle_string_position]
end

EXIT_COMMAND = 'exit!'

def run_cli
  loop do
    puts 'Enter string:'
    input = gets.chomp
    break if input == EXIT_COMMAND

    puts input.empty? ? 'String can not be blank!' : "Middle character: #{get_middle(input)}"
  end
end

run_cli
