class SessionsController < ApplicationController

  def create

    auth_hash = request.env['omniauth.auth']
    @a = auth_hash["uid"]

    # @user = User.new(params.require(:user).permit(:github_uid))

    provider = auth_hash["provider"]

    if provider == 'github'
      c = User.create(github_uid: @a)
      session[:user_id] = c.id
    elsif provider == 'twitter'
      c = User.create(twitter_uid: @a)
      session[:user_id] = c.id
    elsif provider == 'vimeo'
      c = User.create(vimeo_uid: @a)
      session[:user_id] = c.id
    else
      User.create(insta_uid: @a)
      session[:user_id] = c.id
    end
    redirect_to root_path
  end

end
