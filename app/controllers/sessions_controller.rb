class SessionsController < ApplicationController

  def create
    @uid = request.env["omniauth.auth"]["uid"]
    @provider_name = request.env["omniauth.auth"]["provider"]
    if find_provider
      session[:user_id] = find_provider.user_id
    else
      User.create.providers.create(name: @provider_name,
                      uid: @uid,
                      token: request.env['omniauth.auth']["credentials"].token,
                      secret: request.env['omniauth.auth']["credentials"].secret
                      )
      session[:user_id] = find_provider.user_id
    end
    flash[:login] = true
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = true
    redirect_to root_path
  end

  private

  def find_provider
    Provider.find_by_name_and_uid(@provider_name, @uid)
  end
end
