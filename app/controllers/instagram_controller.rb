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
        #posted_time: DateTime.strptime((ig["caption"]["created_time"]),'%Y-%m-%d %H:%M:%S')
        )
      end
    end
  end


  def show #showing who they follow.
    create_instagram_client
    find_provider
  end
    #if you want to pull in a users feed:
    #instagram_feed = current_user.feeds.where(provider: "instagram")
    #@user = Instagram.client.user_recent_media(1574083)



  def search
    # client = Instagram.client(:access_token => session[:access_token])
    create_instagram_client
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
    @provider = Provider.find_by(user_id: session[:user_id], name: "instagram")
  end

  def create_instagram_client
    Instagram.configure do |config|
      config.client_id = ENV["INSTAGRAM_CLIENT_ID"]
      config.client_secret = ENV["INSTAGRAM_API_SECRET"]
      config.access_token =  Provider.find_by(user_id: session[:user_id], name: "instagram").token
    end
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
