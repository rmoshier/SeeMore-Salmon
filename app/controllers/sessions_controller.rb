class SessionsController < ApplicationController

  def create

    auth_hash = request.env['omniauth.auth']
    @a = auth_hash["uid"]

    # @user = User.new(params.require(:user).permit(:github_uid))

    login = User.find_by_auth_hash[:provider]_uid: request.env["omniauth.auth"]["uid"])
    if login.empty?
      User.create((auth_hash[:provider]): request.env["omniauth.auth"][:uid])
    end

    # if provider == 'github'
    #   c = User.create(github_uid: @a)
    #   session[:user_id] = c.id
    # elsif provider == 'twitter'
    #   c = User.create(twitter_uid: @a)
    #   session[:user_id] = c.id
    # elsif provider == 'vimeo'
    #   User.create(vimeo_uid: @a)
    #   session[:user_id] = c.id
    # else
    #   User.create(insta_uid: @a)
    #   session[:user_id] = c.id

    raise
  end



    def destory
      session[:id] = nil
      redirect_to root_path
    end
end






#login = User.where(tostring: request.env["omniauth.auth"][:uid])
#if login.empty?
#create user
#save it
#push into model unloginuser = User.new
#then start a session
#REDIRECT!
