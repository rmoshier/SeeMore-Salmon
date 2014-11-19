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
    else
      User.create(insta_uid: auth_hash["uid"])
    end
    raise
  end

  def destory
    session[:id] = nil
    redirect_to root_path
  end
end






#login = User.where(uid: request.env["omniauth.auth"][:uid], provider: request.env["omniauth.auth"][:provider])
if login.empty?
  #create user
  #save it
  #push into model
  #then start a session
#REDIRECT!
