class HomeController < ApplicationController
  include HTTParty
  Beemo.configuration[:access_token] = ENV["VIMEO_ACCESS_TOKEN"]

  def index
    # Gather all subscriptions for user
    # change this
    # git checkout commit# file_path then hash from the
    # git checkout commit# db/migrate/
    # rake db:drop dp:create db:migrate




    #feeds = Feed.where(uid: session[:user_id])
    # Get vimeo subscriptions from all subscriptions
    #vimeo_feeds = feeds.select {|feed| feed.provider == "vimeo"}
    # Get vimeo uid's for searching api
    #vimeo_uids = vimeo_feeds.collect {|feed| feed.uid.to_s}
    # Searching vimeo api with vimeo uids, returns parsed vimeo json obejct
    #@vimeo_vids = vimeo_uids.collect {|uid|   HTTParty.get("http://vimeo.com/api/v2/" + uid + "/videos.json")}

    ###### Getting info out of nested data structure ######
    #@filtered_videos = @vimeo_vids.collect do |httparty|
    #  httparty.collect do |video_object|
    #    filter_video_response(video_object)
    #  end
    #end

    #@filtered_videos = @filtered_videos.flatten
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
end
