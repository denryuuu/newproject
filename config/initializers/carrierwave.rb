require 'carrierwave/storage/fog'
require 'cloudinary'

CarrierWave.configure do |config|
  config.storage = :cloudinary
  config.cloudinary_credentials = {
    cloud_name: ENV['CLOUDINARY_CLOUD_NAME'],
    api_key: ENV['CLOUDINARY_API_KEY'],
    api_secret: ENV['CLOUDINARY_API_SECRET']
  }
end
