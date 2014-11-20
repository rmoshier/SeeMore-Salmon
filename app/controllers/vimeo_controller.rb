class VimeoController < ApplicationController

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
    @vimeo_username = params['vimeo_username']
    @vimeo_uid = params['vimeo_uid']
    @vimeo_display_name = params['vimeo_display_name']
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
