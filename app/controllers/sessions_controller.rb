class SessionsController < ApplicationController
  # skip_before_filter :verify_authenticity_token, only: :create

  def create
    @uid = request.env["omniauth.auth"]["uid"]
    @provider_name = request.env["omniauth.auth"]["provider"]

    if current_user
      current_user.providers.create(
                  name: @provider_name,
                  uid: @uid,
                  token: request.env['omniauth.auth']["credentials"].token,
                  secret: request.env['omniauth.auth']["credentials"].secret
                      )
    elsif find_provider
      #current_user
      session[:user_id] = find_provider.user_id
    else
      User.create.providers.create(
                      name: @provider_name,
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

  # def be
  #   if session[:user_id]
  #     Provider.create()
  #   end

  private

  def find_provider
    Provider.find_by_name_and_uid(@provider_name, @uid)
  end
end
