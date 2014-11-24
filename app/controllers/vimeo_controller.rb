class VimeoController < ApplicationController
  before_action :current_user

  def index
    @treehouse = Beemo::User.search("treehouse") # => A list of users
  end

  def search
    @name = params['search']
    #@users_info = Beemo::User.search("#{@name}")
  end

  def new
  end

  def create
    # Gathers info from params
    @vimeo_username = params['username']
    @vimeo_uid = params['subscription_uid']
    @vimeo_display_name = params['vimeo_display_name']

    # Saves to database as new subscription
    @vimeo_subscription = Feed.new
    @vimeo_subscription.username = @vimeo_username
    @vimeo_subscription.uid = @vimeo_uid
    @vimeo_subscription.user_id = session[:user_id]
    @vimeo_subscription.provider = "vimeo"
    if @vimeo_subscription.save
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
    raise

    # @users_info.first.profile_pics["sizes"][1]["link"]

    # implement advanced Vimeo API.
    # pull out UID's and search on that?


  end


end
