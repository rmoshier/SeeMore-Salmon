class GithubsController < ApplicationController

  def new
    find_provider
    create_github_client
  end

  def show
    create_github_client
    @search_results = @client.search_users("#{params[:q]} in:login")
  end

  private

  def find_provider
    @provider = Provider.find_by_user_id(session[:user_id])
  end

  def create_github_client
    @client = Octokit::Client.new(:access_token => find_provider.token)
  end

end
