class InstagramController < ApplicationController

  def index
    # client = Instagram.client(:access_token => session[:access_token])
  end

  def new
    create_instagram_client
    find_provider

    instagram_feeds = current_user.feeds.where(provider: "instagram")
    instagram_feeds.each do |feed|
      Instagram.client.user_recent_media(feed.uid.to_i).each do |ig|
        feed.posts.find_or_create_by(author_name: ig["user"]["username"],
        author_handle: ig["user"]["username"],
        author_profile_pic: ig["user"]["profile_picture"],
        content: ig["images"]["low_resolution"]["url"],
        #uid: ig["user"]["id"],
        #posted_time: ig["caption"]["created_time"]
        )
      end
    end
  end


  def show #showing who they follow.
    create_instagram_client
    find_provider

  end

    #instagram_feed = current_user.feeds.where(provider: "instagram")
    #@user = Instagram.client.user_recent_media(1574083)



  def search
    # client = Instagram.client(:access_token => session[:access_token])
    # create_instagram_client
    find_provider
    @srch = params[:q]
    @feed = Instagram.client.user_search(@srch)

  end


  def create
    find_provider
    create_instagram_client

    @feed = Feed.find_by_uid(params[:feed_uid])

    if @feed
      current_user.subscriptions.create(feed_id: @feed.id)
    else
      current_user.feeds.create(provider: params["controller"],
                                uid: params[:feed_uid]) # missing username
    end
  end

  private

  def find_provider
    @provider = Provider.find_by_user_id(session[:user_id])
  end

  def create_instagram_client
    Instagram.configure do |config|
      config.client_id = ENV["INSTAGRAM_CLIENT_ID"]
      config.client_secret = ENV["INSTAGRAM_API_SECRET"]
      config.access_token =  Provider.find_by_user_id(session[:user_id]).token
    end
  end


  def isprivate?(uid)
    response = HTTParty.get('https://api.instagram.com/v1/users/#{uid}/relationship')
    response.code == 400 ? true : false
  end

end


# SIDE:
# create_instagram_client
# #find_provider
# instagram_feeds = current_user.feeds.where(provider: "instagram")
# instagram_feeds.each do |feed|
#   Instagram.client.user_recent_media(feed.uid.to_i).each do |ig|
#     #if ig.id.nil?
#       feed.posts.create(author_name: ig.user.name)
#     #end
#   end
# end
