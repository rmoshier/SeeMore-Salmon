class HomeController < ApplicationController

  def index
    @vimeo_vids = Vimeo::Simple::User.videos("user4438428")
    #raise
  end

  def show

  end


end
