class HomeController < ApplicationController
  #before_action :current_user

  include HTTParty
  #Beemo.configuration[:access_token] = ENV["VIMEO_ACCESS_TOKEN"]

  def index
    if session[:user_id]

      load_vimeo_data
      load_twitter_data
      load_insta_data if current_user.providers.find_by(name: "instagram")

      @posts = current_user.posts.order(posted_time: :desc) #.limit(20)
    end
  end

  private

  # TWITTER

  def find_twitter_provider
    @provider = Provider.find_by_name_and_user_id("twitter", session[:user_id])
  end

  def create_twitter_client
    find_twitter_provider

    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_API_KEY"]
      config.consumer_secret     = ENV["TWITTER_API_SECRET"]
      config.access_token        = @provider.token
      config.access_token_secret = @provider.secret
    end
  end

  # only query api for newest tweets:
  # keep track of timestamp for a user
  # grab everything since then
  def load_twitter_data
    create_twitter_client
    twitter_feeds = current_user.feeds.where(provider: "twitter")

    twitter_feeds.each do |feed|
      @client.user_timeline(feed.uid.to_i).each do |tweet|
        feed.posts.find_or_create_by(
          author_name: tweet.user.name,
          author_handle: tweet.user.handle,
          author_profile_pic: tweet.user.profile_image_uri.to_s,
          content: tweet.text,
          uid: tweet.id.to_s,
          posted_time: tweet.created_at
        )
      end
    end
  end

  # VIMEO

  def load_vimeo_data
    # get vimeo Feed objects only
    vimeo_feeds = current_user.feeds.find_all{ |feed| feed.provider == "vimeo" }
    # Get vimeo Feed uid's for searching api
    vimeo_uids = vimeo_feeds.collect { |feed| feed.uid }
    # Searching vimeo api with vimeo uids, returns parsed vimeo json obejct
    @vimeo_vids = vimeo_uids.collect { |uid| HTTParty.get("http://vimeo.com/api/v2/" + uid + "/videos.json") }

    ###### Getting info out of nested data structure ######
    @filtered_videos = @vimeo_vids.collect do |httparty|
     httparty.collect do |video_object|
       filter_video_response(video_object)
     end
    end
    @filtered_videos.flatten!
    create_vimeo_posts(@filtered_videos)
  end

  def filter_video_response(raw_video_object)
    filtered_video_object = {}
    filtered_video_object[:title] = raw_video_object["title"]
    filtered_video_object[:uid] = raw_video_object["id"]
    filtered_video_object[:url] = raw_video_object["url"]
    filtered_video_object[:thumbnail] = raw_video_object["thumbnail_medium"]
    filtered_video_object[:username] = raw_video_object["user_name"]
    filtered_video_object[:upload_date] = DateTime.strptime(raw_video_object["upload_date"],  '%Y-%m-%d %H:%M:%S')
    filtered_video_object[:user_id] = raw_video_object["user_id"]
    return filtered_video_object
  end

  def create_vimeo_posts(filtered_videos)
    filtered_videos.each do |video|
      feed_object = Feed.find_by(uid: video[:user_id].to_s)
      Post.create(author_name: video[:username],
                  posted_time: video[:upload_date],
                  content: video[:thumbnail],
                  uid: video[:uid],
                  feed_id: feed_object.id)
    end
  end

  # INSTA

  def load_insta_data
    create_instagram_client
    instagram_feeds = current_user.feeds.where(provider: "instagram")

    instagram_feeds.each do |feed|
      Instagram.client.user_recent_media(feed.uid.to_i).each do |ig|
        feed.posts.find_or_create_by(author_name: ig["user"]["username"],
        author_handle: ig["user"]["username"],
        author_profile_pic: ig["user"]["profile_picture"],
        content: ig["images"]["low_resolution"]["url"],
        uid: ig["id"],
        posted_time: Time.at(ig[:created_time].to_i)
        )
      end
    end
  end

  def create_instagram_client
    @insta_provider = Provider.find_by_name_and_user_id("instagram", session[:user_id])

    Instagram.configure do |config|
      config.client_id = ENV["INSTAGRAM_CLIENT_ID"]
      config.client_secret = ENV["INSTAGRAM_API_SECRET"]
      config.access_token =  @insta_provider.token
    end
  end
end
