class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    if session[:user_id]
      @user = User.find(session[:user_id])
    else
      redirect_to root_path
    end
  end
end

#   def require_login
#     @user = User.new(params.require(:user).permit(:github_uid))
#
#     login = User.find_by_auth_hash[:@provider]_uid: request.env["omniauth.auth"]["uid"])
#     if login.empty?
#       User.create((auth_hash[:@provider]): request.env["omniauth.auth"][:uid])
#     end
