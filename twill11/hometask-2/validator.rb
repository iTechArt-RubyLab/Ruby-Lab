# frozen_string_literal: true

# Validate errors
class Validator
  def initialize(str)
    @str = str
    @errors = []
  end

  def validate
    add_error('String can not be blank!') if empty?
  end

  def valid?
    error_messages.empty?
  end

  def error_messages
    errors.join(',')
  end

  private

  attr_reader :str, :errors

  def empty?
    str.strip.empty?
  end

  def add_error(error)
    errors << error
  end
end
