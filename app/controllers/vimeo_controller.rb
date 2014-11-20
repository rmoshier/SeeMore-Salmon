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
