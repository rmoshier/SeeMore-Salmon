class SessionsController < ApplicationController

  # User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
  # http://railscasts.com/episodes/241-simple-omniauth
  def require_login
    auth_hash = request.env['omniauth.auth']
    @uid = auth_hash["uid"]
    @provider = auth_hash[:provider]

    if @provider == 'github'
      if user = User.find_by(github_uid: @uid)
        session[:user_id] = user.id
      else
        user = User.create(github_uid: @uid)
        session[:user_id] = user.id
      end
    elsif @provider == 'twitter'
      if user = User.find_by_twitter_uid(@uid)
        session[:user_id] = user.id
      else
        user = User.create(twitter_uid: @uid)
        session[:user_id] = user.id
      end
    elsif @provider == 'vimeo'
      if user = User.find_by_vimeo_uid(@uid)
        session[:user_id] = user.id
      else
        user = User.create(vimeo_uid: @uid)
        session[:user_id] = user.id
      end
    else
      if user = User.find_by_insta_uid(@uid)
        session[:user_id] = user.id
      else
        user = User.create(insta_uid: @uid)
        session[:user_id] = user.id
      end
    end
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end

# login = User.find_by_auth_hash[:@provider]_uid: request.env["omniauth.auth"]["uid"])
# if login.empty?
#   User.create((auth_hash[:@provider]): request.env["omniauth.auth"][:uid])
# end

#login = User.where(tostring: request.env["omniauth.auth"][:uid])
#if login.empty?
#create user
#save it
#push into model unloginuser = User.new
#then start a session
#REDIRECT!

#could use Bookis' fix:  User.find_by("diu".reverse => 1234)
