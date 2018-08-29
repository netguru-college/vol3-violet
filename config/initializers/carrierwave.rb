CarrierWave.configure do |config|
  config.storage = Rails.configuration.carrierwave_storage
  config.dropbox_access_token = Rails.application.credentials[:dropbox][:access_key]
end