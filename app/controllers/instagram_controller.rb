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
    # render :instagram_results
  end


  def create
  #   @instagram_username = params['username']
  #   find_provider
  #   @user = User.find(session[:user_id])
  #   @provider = params[:provider]
  #   @name = params['search']
  #   client = Instagram.client(:access_token => session[:access_token])
  #   @search_results = create_instagram_client.user_search(params[:name])
  #   @results = client.user_search(params[:username], { count: 10 })
  end

  private

  def find_provider
    @provider = Provider.find_by_user_id(session[:user_id])
  end

  def create_instagram_client
    Instagram.configure do |config|
      config.client_id =
      config.client_secret = 
      # config.access_token_secret = @provider.secret
    end
  end

end
