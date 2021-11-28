# frozen_string_literal: true

# Config
class Config
  require 'json'
  CONFIGS_DIRECTORY = './configs'

  def read(config_file)
    file_content = File.read("#{CONFIGS_DIRECTORY}/#{config_file}")
    JSON.parse(file_content)
  end
end
