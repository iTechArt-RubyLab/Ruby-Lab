# frozen_string_literal: true

# Validate errors
class Validator
  def initialize(town)
    @town = town
    @errors = []
  end

  def validate
    add_error('City name can not be blank!') if empty?
  end

  def valid?
    errors.empty?
  end

  def error_messages
    errors.join(',')
  end

  private

  attr_reader :town, :errors

  def empty?
    town.strip.empty?
  end

  def add_error(error)
    errors << error
  end
end
