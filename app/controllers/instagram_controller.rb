class InstagramController < ApplicationController
  before_action :current_user


  def index
    respond_to do |format|
      format.html
    end
  end

  # Get popular Instagram media


  # Search for Instagram user
  def search
    @results = Instagram.user_search(params[:query])
    respond_to do |format|
      format.html
      format.json { render :json => @results }
    end
  end


end


https://instagram.com/oauth/authorize/?client_id=9001143e9274470b8e6778e59d1d5c48&amp;redirect_uri=http://localhost:3000/auth/instagram/callback&amp;response_type=token
