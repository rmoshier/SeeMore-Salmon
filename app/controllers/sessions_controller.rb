class SessionsController < ApplicationController

  def create

    auth_hash = request.env['omniauth.auth']
    @a = auth_hash["uid"]

    provider = auth_hash["provider"]
    if provider == 'github'
      User.create(github_uid: @a)
    elsif provider == 'twitter'
      User.create(twitter_uid: auth_hash["uid"])
    elsif provider == 'vimeo'
      User.create(vimeo_uid: auth_hash["uid"])
    elsif
      User.create(insta_uid: auth_hash["uid"])
    else
      User.create(twitter_uid: auth_hash["uid"])
    raise
    end
  end

    # @user = User.new(params.require(:user).permit(:github_uid))

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
