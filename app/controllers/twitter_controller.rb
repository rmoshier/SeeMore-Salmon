class TwitterController < ApplicationController

  def new
    provider = Provider.find_by_user_id(session[:user_id])
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_API_KEY"]
      config.consumer_secret     = ENV["TWITTER_API_SECRET"]
      config.access_token        = provider.token
      config.access_token_secret = provider.secret
    end
  end

  def show

  end

  def create
  end
end

# client.get_all_tweets("sferik")
