class SessionsController < ApplicationController

  def create

    auth_hash = request.env['omniauth.auth']
    @a = auth_hash["uid"]

    @user = User.new(params.require(:user).permit(:github_uid))

    provider = auth_hash["provider"]

    if provider == 'github'
      User.create(github_uid: @a)
      session[:id] = User.last[:id]
    elsif provider == 'twitter'
      User.create(twitter_uid: @a)
    elsif provider == 'vimeo'
      User.create(vimeo_uid: @a)
    else
      User.create(insta_uid: @a)
    end
    raise
  end

end
