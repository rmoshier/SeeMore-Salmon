class HomeController < ApplicationController
  #before_action :current_user

  include HTTParty
  Beemo.configuration[:access_token] = ENV["VIMEO_ACCESS_TOKEN"]

  def index
    #@feeds = current_user.feeds
    #create_twitter_client


    # Gather all subscriptions for user
    # change this
    # git checkout commit# file_path then hash from the
    # git checkout commit# db/migrate/
    # rake db:drop dp:create db:migrate



    # still not working.
    # 1 get subscriptions of a user
    subscriptions = Subscription.where(user_id: session[:user_id].to_s)
    # 2 get feeds from subscriptions
    feeds = subscriptions.collect {|subscription| Feed.where(id: subscription.feed_id)}
    #raise
    # Get vimeo feeds from all subscriptions
    vimeo_feeds = feeds.select {|feed| feed.provider == "vimeo"}


    ## THIS WAS the start of a merge conflict
    #feeds = Feed.where(uid: session[:user_id])
    # Get vimeo subscriptions from all subscriptions
    #vimeo_feeds = feeds.select {|feed| feed.provider == "vimeo"}

    ## This was the end
    # Get vimeo uid's for searching api
    vimeo_uids = vimeo_feeds.collect {|feed| feed.uid.to_s}
    # Searching vimeo api with vimeo uids, returns parsed vimeo json obejct
    @vimeo_vids = vimeo_uids.collect {|uid|   HTTParty.get("http://vimeo.com/api/v2/" + uid + "/videos.json")}

    ###### Getting info out of nested data structure ######
    @filtered_videos = @vimeo_vids.collect do |httparty|
     httparty.collect do |video_object|
       filter_video_response(video_object)
     end
    end

    @filtered_videos = @filtered_videos.flatten
  end

  def filter_video_response(raw_video_object)
    filtered_video_object = {}
    filtered_video_object[:title] = raw_video_object["title"]
    filtered_video_object[:url] = raw_video_object["url"]
    filtered_video_object[:thumbnail] = raw_video_object["thumbnail_medium"]
    filtered_video_object[:username] = raw_video_object["user_name"]
    return filtered_video_object
  end

  def show
  end

  def create_twitter_client
    provider = Provider.find_by_user_id(session[:user_id])

    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_API_KEY"]
      config.consumer_secret     = ENV["TWITTER_API_SECRET"]
      config.access_token        = provider.token
      config.access_token_secret = provider.secret
    end
  end
end
