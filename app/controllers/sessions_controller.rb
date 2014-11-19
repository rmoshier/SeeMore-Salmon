class SessionsController < ApplicationController

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
