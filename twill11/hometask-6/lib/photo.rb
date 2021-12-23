# frozen_string_literal: true

require 'dry-initializer'

# Photo attributes
class Photo
  HEADERS = ['photo id', 'person real name', 'photo title', 'link to image'].freeze

  extend Dry::Initializer

  param :photo_id
  param :user_name
  param :photo_title
  param :image_link

  def photo_dataset
    [photo_id, user_name, photo_title, image_link]
  end
end
