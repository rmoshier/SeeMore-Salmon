class GithubsController < ApplicationController

  def new
    find_provider
    create_github_client
  end

  private

  def find_provider
    @provider = Provider.find_by_user_id(session[:user_id])
  end

  def create_github_client
    # Provide authentication credentials
    Octokit.configure do |config|
      config.client_id = ENV["GITHUB_CLIENT_ID"]
      config.client_secret = ENV["GITHUB_CLIENT_SECRET"]
    end

    # Fetch the current user
    Octokit.user

  end
end
