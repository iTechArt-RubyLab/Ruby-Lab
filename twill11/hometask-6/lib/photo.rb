# frozen_string_literal: true

require 'dry-initializer'

class Photo
  extend Dry::Initializer

  param :photo_id
  param :user_name
  param :photo_title
  param :image_link
end
