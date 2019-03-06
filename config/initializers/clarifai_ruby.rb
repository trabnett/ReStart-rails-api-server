ClarifaiRuby.configure do |config|
    config.base_url       = "https://api.clarifai.com"
    config.version_path   = "/v2"
    config.client_id      = ENV['CLARIFAI_CLIENT_ID']
    config.client_secret  = ENV['CLARIFAI_API']
  end