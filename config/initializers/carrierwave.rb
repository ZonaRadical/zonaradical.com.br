# NullStorage provider for CarrierWave for use in tests.  Doesn't actually
# upload or store files but allows test to pass as if files were stored and
# the use of fixtures.
CarrierWave.configure do |config|
  if Rails.env == 'production'
    config.storage :fog
    config.fog_credentials = {
        :provider               => 'AWS',                        # required
        :aws_access_key_id      => ENV['AMAZON_ACCESS_KEY_ID'],                        # required
        :aws_secret_access_key  => ENV['AMAZON_SECRET_ACCESS_KEY'],                        # required
        :region                 => 'sa-east-1',                  # optional, defaults to 'us-east-1'
        #:host                   => 's3.example.com',             # optional, defaults to nil
        #:endpoint               => 'https://s3.example.com:8080' # optional, defaults to nil
    }
    config.fog_directory  = 'zonaradical'                     # required
  elsif Rails.env == 'test'
    config.storage :file
    # Required to prevent FactoryGirl from giving an infuriating exception
    # ArgumentError: wrong exec option
    # It also speeds up tests so it's a good idea
    config.enable_processing = false
  else
    config.storage :file
  end

  #config.fog_public     = false                                   # optional, defaults to true
  #config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end
