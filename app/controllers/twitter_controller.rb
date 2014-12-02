class TwitterController < ApplicationController
  before_action :current_user

  # will this break is someone logs in using a non-Twitter provider?

  def new
    find_provider
    create_twitter_client
  end

  def show
    find_provider
    @search_results = create_twitter_client.user_search(params[:username])
  end

  def create
    @feed = Feed.find_by_uid(params[:feed_uid])
    if @feed
      current_user.subscriptions.find_or_create_by(feed_id: @feed.id)
    else
      current_user.feeds.create(provider: params["controller"],
                                uid: params[:feed_uid]) # missing username
    end
    redirect_to root_path
  end

  # Should these methods just be in a model instead?
  private

  def find_provider
    @provider = Provider.find_by_name_and_user_id("twitter", session[:user_id])
  end

  # Better way to do this with OmniAuth?
  def create_twitter_client
    find_provider
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_API_KEY"]
      config.consumer_secret     = ENV["TWITTER_API_SECRET"]
      config.access_token        = @provider.token
      config.access_token_secret = @provider.secret
    end
  end
end

# client.get_all_tweets("sferik")
