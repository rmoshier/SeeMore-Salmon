class VimeoController < ApplicationController
  before_action :current_user

  def index
  end

  def search
    create_vimeo_client
    @name = params['search']
  end

  def new
  end

  def create
    @vimeo_uid = params['subscription_uid']
    @vimeo_feed = Feed.find_or_create_by(uid: @vimeo_uid, provider: "vimeo")
    # @vimeo_feed.provider = "vimeo"
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
    create_vimeo_client
    @users_info = Beemo::User.search("#{@name}")
  end

  private

  def create_vimeo_client
    Provider.find_by(user_id: session[:user_id], name: "vimeo").token
  end


end
