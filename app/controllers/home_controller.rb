class HomeController < ApplicationController

  def index
    # Gather all subscriptions for user
    subscriptions = Subscription.where(user_id: session[:user_id])
    # Get vimeo subscriptions from all subscriptions
    vimeo_subscriptions = subscriptions.select {|sub| sub.provider == "vimeo"}
    # Get vimeo usernames for searching api
    vimeo_usernames = vimeo_subscriptions.collect {|sub| sub.username}
    # Searching vimeo api with vimeo usernames, returns parsed vimeo json obejct
    @vimeo_vids = vimeo_usernames.collect {|user| Vimeo::Simple::User.videos(user)}

    ###### THE ACTUAL CODE ######

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


end
