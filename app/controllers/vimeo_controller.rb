class VimeoController < ApplicationController
  before_action :current_user
  
  def index
    @user_info = Vimeo::Simple::User.info("beyonce")
    @user_name = @user_info["display_name"]
    # this should be new.
  end

  def search
    @name = params['search']
    @user_info = Vimeo::Simple::User.info("#{@name}")
  end

  def new
  end

  def create
    @vimeo_username = params['username']
    @vimeo_uid = params['subscription_uid']
    @vimeo_display_name = params['vimeo_display_name']
    #save to database as new subscription
    @vimeo_subscription = Subscription.new(params.require(:vimeo).permit(:username, :subscription_uid))
    @vimeo_subscription.update(user_id: session[:id], provider: 'vimeo')
    #redirect_to root_path
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def show
    @name = params['search']
    @user_info = Vimeo::Simple::User.info("#{@name}")
  end


end
