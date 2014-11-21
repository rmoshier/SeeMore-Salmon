class InstagramController < ApplicationController

  def create_instagram_client
  @Instagram.configure do |config|
    config.client_id = "INSTAGRAM_CLIENT_ID"
    config.client_secret = "INSTAGRAM_API_SECRET"
  end

  def new
    find_provider
    create_instagram_client
  end


  def show
    find_provider
    @search_results = create_instagram_client.user_search(params[:username])

  end

  def search
    find_provider
    @search_results = create_instagram_client.user_search(params[:username])
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
