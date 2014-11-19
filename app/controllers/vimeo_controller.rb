class VimeoController < ApplicationController

  def index
    @user_info = Vimeo::Simple::User.info("beyonce")
    @user_name = @user_info["display_name"]
  end

  def search
    @name = params['search']
    @user_info = Vimeo::Simple::User.info("#{@name}")
    redirect_to vimeo_path
  end

  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def show
  end


end
