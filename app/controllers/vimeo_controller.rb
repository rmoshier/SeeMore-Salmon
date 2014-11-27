class VimeoController < ApplicationController
  before_action :current_user

  def index
  end

  def search
    @name = params['search']
  end

  def new
  end

  def create
    # Saves to database as new subscription
    @vimeo_feed = Feed.new
    @vimeo_feed.uid = params['subscription_uid']
    @vimeo_feed.provider = "vimeo"
    if @vimeo_feed.save
      # Create join table relationship bt Feed and Subscription
      @vimeo_feed.subscriptions.create(user_id: session[:user_id], feed_id: @vimeo_feed.id)
      redirect_to root_path
    else
      render :new
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def show
    @name = params['search']
    @users_info = Beemo::User.search("#{@name}")
  end


end
