class VimeoController < ApplicationController
  def new
    @user_info = Vimeo::Simple::User.info("beyonce")
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

  def index
  end
end
