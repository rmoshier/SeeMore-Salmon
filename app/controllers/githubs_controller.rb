class GithubsController < ApplicationController

  def new
    # find_provider
    create_github_client
  end

  private

  # def find_provider
  #   @provider = Provider.find_by_user_id(session[:user_id])
  # end

  def create_github_client
    # Provide authentication credentials
    Octokit.configure do |c|
      c.login = 'defunkt'
      c.password = 'c0d3b4ssssss!'
    end

    # Fetch the current user
    Octokit.user

  end
end
