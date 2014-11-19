class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    # pulls out session id
    @user = User.find(session[:user_id])
    # that is the session
    # this method is what we require on the user controller w/out breaking the home page
  end

#     auth_hash = request.env['omniauth.auth']
#     @a = auth_hash["uid"]
#     @provider = auth_hash[:provider]
#
#   def existing_user
#     if @provider == 'github'
#       c = User.find(githib_uid: @a)
#       session[:user_id] = c.id
#     elsif @provider == 'twitter'
#       c = User.find(twitter_uid: @a)
#       session[:user_id] = c.id
#     elsif @provider == 'vimeo'
#       c = User.find(vimeo_uid: @a)
#       session[:user_id] = c.id
#     else
#       c = User.find(insta_uid: @a)
#       session[:user_id] = c.id
#     end
#   end
#
#   def require_login
#
#
#     # @user = User.new(params.require(:user).permit(:github_uid))
#
#     # login = User.find_by_auth_hash[:@provider]_uid: request.env["omniauth.auth"]["uid"])
#     # if login.empty?
#     #   User.create((auth_hash[:@provider]): request.env["omniauth.auth"][:uid])
#     # end
#
#     if @provider == 'github'
#       c = User.create(github_uid: @a)
#       session[:user_id] = c.id
#     elsif @provider == 'twitter'
#       c = User.create(twitter_uid: @a)
#       session[:user_id] = c.id
#     elsif @provider == 'vimeo'
#       User.create(vimeo_uid: @a)
#       session[:user_id] = c.id
#     else
#       User.create(insta_uid: @a)
#       session[:user_id] = c.id
#     end
#
#   end
#
#   # need to add if they alredy exist
#
#
end
