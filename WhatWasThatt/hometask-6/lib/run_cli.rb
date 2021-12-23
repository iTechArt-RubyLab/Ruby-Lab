# frozen_string_literal: true

require_relative 'characters/processor'
require_relative 'deaths/processor'
require_relative 'characters/list'

# service to connect users inputs and characters with their death info
class RunCli
  def run_cli
    run
  end

  private

  attr_accessor :name

  EXIT_COMMANDS = %w[exit! !!! exit].freeze

  LIST_COMMANDS = %w[list -l --list --l l].freeze

  def run
    loop do
      info_message
      read_character
      break if exit?

      if list?
        print_characters_list
        next
      end
      death_message
    end
  end

  def exit?
    EXIT_COMMANDS.include?(name)
  end

  def list?
    LIST_COMMANDS.include?(name)
  end

  def characters_list
    Characters::List.new(characters_hash).call
  end

  def print_characters_list
    puts characters_list
  end

  def read_character
    @name = gets.chomp
  end

  def info_message
    puts 'Enter name of character: '
  end

  def death_message
    puts(death_info)
  end

  def characters_hash
    Characters::Processor.new(:pdf, 'characters').call
  end

  def death_info
    Deaths::Processor.new(characters_hash, name, :csv, "#{name.split(' ')[0]}_death").call
  end
end

RunCli.new.run_cli
