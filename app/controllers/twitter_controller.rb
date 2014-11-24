class TwitterController < ApplicationController
  before_action :current_user

  def new
    find_provider
    create_twitter_client
  end

  def show
    find_provider
    @search_results = create_twitter_client.user_search(params[:username])
  end

  def create
    find_provider
  end

  # Should these methods just be in a model instead?
  private

  def find_provider
    @provider = Provider.find_by_user_id(session[:user_id])
  end

  # Better way to do this with OmniAuth?
  def create_twitter_client
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_API_KEY"]
      config.consumer_secret     = ENV["TWITTER_API_SECRET"]
      config.access_token        = @provider.token
      config.access_token_secret = @provider.secret
    end
  end
end

# client.get_all_tweets("sferik")
