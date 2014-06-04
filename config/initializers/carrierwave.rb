CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => ENV["AWS_ACCESS_KEY_ID"],       # required
    :aws_secret_access_key  => ENV["AWS_SECRET_ACCESS_KEY"],
    :region                 => 'us-east-1'
  }
  config.fog_directory  = 'castmate-assets'
  config.storage = :fog
  # see https://github.com/jnicklas/carrierwave#using-amazon-s3
  # for more optional configuration
end
