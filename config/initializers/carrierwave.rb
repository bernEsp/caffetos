if Rails.env.test?   # Store the files locally for test and development environment
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end
end

if Rails.env.development? || Rails.env.production? # Using Amazon S3 for Development and Production
  CarrierWave.configure do |config|
    config.root = Rails.root.join('tmp') # adding these...
    config.cache_dir = 'carrierwave' # ...two lines
    config.storage = :fog
    config.fog_credentials = {
        :provider => 'AWS', # required
        :aws_access_key_id => ENV['S3_ACCESS_KEY_ID'] , # required
        :aws_secret_access_key => ENV['S3_SECRET_ACCESS_KEY'], # required
    } 
    config.fog_directory = ENV['S3_BUCKET'] # required
  end
end