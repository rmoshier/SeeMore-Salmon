Rails.application.config.middleware.use OmniAuth::Builder do

  provider :github,  ENV["GITHUB_CLIENT_ID"], ENV["GITHUB_CLIENT_SECRET"]
  provider :vimeo,   ENV["VIMEO_CLIENT_ID"],  ENV["VIMEO_CLIENT_SECRET"]
  provider :twitter, ENV["TWITTER_API_KEY"],  ENV["TWITTER_API_SECRET"]

end
