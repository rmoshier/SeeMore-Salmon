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

end
