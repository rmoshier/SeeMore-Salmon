class InstagramController < ApplicationController

  def create_instagram_client
  @Instagram.configure do |config|
    config.client_id = "INSTAGRAM_CLIENT_ID"
    config.client_secret = "INSTAGRAM_API_SECRET"
  end

  def new
    find_provider
    @results = Instagram.client.user_search(params[:instagram])
    raise
  end


  def show
    find_provider
    @results = Instagram.client.user_search(params[:username])

  end

  def search
    raise
    @results = Instagram.client.user_search(params[:instagram])


  end

  def create
    find_provider
    raise
  end

  private

  def find_provider
    @provider = Provider.find_by_user_id(session[:user_id])
  end


  end
end
