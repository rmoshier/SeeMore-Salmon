class SessionsController < ApplicationController

  def require_login
    auth_hash = request.env['omniauth.auth']
    @a = auth_hash["uid"]
    @provider = auth_hash[:provider]



    # login = User.find_by_auth_hash[:@provider]_uid: request.env["omniauth.auth"]["uid"])
    # if login.empty?
    #   User.create((auth_hash[:@provider]): request.env["omniauth.auth"][:uid])
    # end

    if @provider == 'github'
      if login = User.find_by(github_uid: @a)
        User.find(session[:user_id])
      else login.empty?
        c = User.create(github_uid: @a)
        session[:user_id] = c.id
      end
    elsif @provider == 'twitter'
      if login = User.find_by(twitter_uid: @a)
        User.find(session[:user_id])
      else c = User.create(twitter_uid: @a)
        session[:user_id] = c.id
      end
    elsif @provider == 'vimeo'
      if login = User.find_by(vimeo_uid: @a)
        User.find(session[:user_id])
      else c = User.create(vimeo_uid: @a)
        session[:user_id] = c.id
      end
    else
      if login = User.find_by(vimeo_uid: @a)
        User.find(session[:user_id])
      else c = User.create(insta_uid: @a)
        session[:user_id] = c.id
      end
    end
    redirect_to root_path
  end

  def destroy
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

#could use Bookis' fix:  User.find_by("diu".reverse => 1234)
