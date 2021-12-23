# frozen_string_literal: true

require_relative 'characters/processor'
require_relative 'deaths/processor'

# service to connect users inputs and characters with their death info
class RunCli
  def run_cli
    run
  end

  private

  attr_accessor :name

  EXIT_COMMANDS = %w[exit! !!! exit].freeze

  def run
    loop do
      info_message
      read_character
      break if exit?

      death_message
    end
  end

  def exit?
    EXIT_COMMANDS.include?(name)
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
    Characters::Processor.new(:csv, 'characters').call
  end

  def death_info
    Deaths::Processor.new(characters_hash, name, :csv, "#{name.split(' ')[0]}_death").call
  end
end

RunCli.new.run_cli
