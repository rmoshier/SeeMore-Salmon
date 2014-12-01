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
        # try find_or_create_by(uid: blahblahid)
        # if tweet.id.nil?
        feed.posts.create(author_name: tweet.user.name,
                          author_handle: tweet.user.handle,
                          author_profile_pic: tweet.user.profile_image_uri.to_s,
                          content: tweet.text,
                          uid: tweet.id,
                          posted_time: tweet.created_at
        )
        #end
        end
      end

    # VIMEO POSTS IN DB

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

    @posts = current_user.posts.order("posted_time").limit(20)

    end
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

  def show
  end

  def create_twitter_client
    @provider = Provider.find_by_user_id(session[:user_id])

    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_API_KEY"]
      config.consumer_secret     = ENV["TWITTER_API_SECRET"]
      config.access_token        = Provider.find_by_user_id(session[:user_id]).token
      config.access_token_secret = @provider.secret
    end
  end


  def create_instagram_client
    @provider = Provider.find_by_user_id(session[:user_id])

     Instagram.configure do |config|
      config.client_id = ENV["INSTAGRAM_CLIENT_ID"]
      config.client_secret = ENV["INSTAGRAM_API_SECRET"]
      config.access_token =  Provider.find_by_user_id(session[:user_id]).token
    end
  end

  def find_provider
    @provider = Provider.find_by_user_id(session[:user_id])
  end

end
