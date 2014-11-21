require 'rubygems'
require 'bundler/setup'
require "instagram"



# All methods require authentication (either by client ID or access token).
# To get your Instagram OAuth credentials, register an app at http://instagr.am/oauth/client/register/
Instagram.configure do |config|
  # stuff goes here
end

CALLBACK_URL = "http://localhost:3000/auth/instagram/callback"

class InstagramController < ApplicationController

  #check for token
  def index

  end

  # Search for Instagram user
  def search
    @results = Instagram.user_search(params[:query])
    respond_to do |format|
      format.html
      format.json { render :json => @results }
    end
  end

  # Get current authenticated users info
  def user
    respond_to do |format|
      format.html
      format.json { render :json => @results }
    end
  end

  # Connect to Instagram for authorization, handled in js code
  def authorize
    #redirect_to Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
  end

  # Callback handler for Instagram authorization, handled in js code
  def callback
    #@code = params[:code];
    #response = Instagram.get_access_token(@code, :redirect_uri => CALLBACK_URL)
    #session[:access_token] = @code
    #redirect_to :controller => 'instagram', :action => 'index'
  end

  # Instagram page for handling api calls

end
