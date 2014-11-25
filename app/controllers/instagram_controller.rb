class InstagramController < ApplicationController

  def index
    # client = Instagram.client(:access_token => session[:access_token])
  end

  def new
    create_instagram_client
    find_provider
  end


  def show
  end

  def search
    # client = Instagram.client(:access_token => session[:access_token])
    create_instagram_client
    find_provider
    @srch = params[:q]
    @results = Instagram.client.user_search(@srch)

  end


  def create
    find_provider
    @instagram_username = params['username']
    @instagram_uid = params['subscription_uid']
    @instagram_name = params['instagram_display_name']

    # Saves to database as new subscription
    @instagram_feed = Feed.new
    @instagram_feed.username = @instagram_username
    @instagram_feed.uid = @instagram_uid
    @instagram_feed.user_id = session[:user_id]
    @instagram_feed.provider = "instagram"
  end

  private

  def find_provider
    @provider = Provider.find_by_user_id(session[:user_id])
  end

  def create_instagram_client
    Instagram.configure do |config|
      config.client_id = ENV["INSTAGRAM_CLIENT_ID"]
      config.client_secret = ENV["INSTAGRAM_API_SECRET"]
      # config.access_token_secret = @provider.secret
    end
  end

end
