class HomeController < ApplicationController
  #before_action :current_user

  include HTTParty
  #Beemo.configuration[:access_token] = ENV["VIMEO_ACCESS_TOKEN"]

  def index
    if session[:user_id]
    # Kristen to refactor this...
    create_twitter_client
    twitter_feeds = current_user.feeds.where(provider: "twitter")
    twitter_feeds.each do |feed|
      # put this in a new method
      @client.user_timeline(feed.uid.to_i).each do |tweet|
        if tweet.id.nil?
        feed.posts.create(author_name: tweet.user.name,
                          author_handle: tweet.user.handle,
                          author_profile_pic: tweet.user.profile_image_uri.to_s,
                          content: tweet.text,
                          uid: tweet.id,
                          posted_time: tweet.created_at
        )
        end
      end
    end
    @posts = Post.last(10)



    # Gather all subscriptions for user
    # change this
    # git checkout commit# file_path then hash from the
    # git checkout commit# db/migrate/
    # rake db:drop dp:create db:migrate

      # get vimeo Feed objects only
      vimeo_feeds = current_user.feeds.find_all{ |feed| feed.provider == "vimeo" }
      # Get vimeo Feed uid's for searching api
      vimeo_uids = vimeo_feeds.collect {|feed| feed.uid.to_s}
      # Searching vimeo api with vimeo uids, returns parsed vimeo json obejct
      @vimeo_vids = vimeo_uids.collect {|uid| HTTParty.get("http://vimeo.com/api/v2/" + uid + "/videos.json")}

      ###### Getting info out of nested data structure ######
      @filtered_videos = @vimeo_vids.collect do |httparty|
       httparty.collect do |video_object|
         filter_video_response(video_object)
       end
      end

      @filtered_videos = @filtered_videos.flatten

    end
  end

  def filter_video_response(raw_video_object)
    filtered_video_object = {}
    filtered_video_object[:title] = raw_video_object["title"]
    filtered_video_object[:url] = raw_video_object["url"]
    filtered_video_object[:thumbnail] = raw_video_object["thumbnail_medium"]
    filtered_video_object[:username] = raw_video_object["user_name"]
    filtered_video_object[:upload_date] = DateTime.strptime(raw_video_object["upload_date"],  '%Y-%m-%d %H:%M:%S')
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
