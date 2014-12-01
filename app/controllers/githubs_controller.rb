class GithubsController < ApplicationController

  def new
    find_provider
    create_github_client
    # raise
  end

  def show
    @client = Octokit::Client.new(:access_token => find_provider.token)
    @search_results = @client.search_users("#{params[:q]} in:login")
    # raise
  end

# Octokit.search_users("book in:login")

  def search
    find_provider
    # raise
    # client = Instagram.client(:access_token => session[:access_token])
    # create_github_client
    # find_provider
    # @srch = params[:q]
    # @results = Github.client.user_search(@srch)
    # render :instagram_results
  end

  private

  def find_provider
    @provider = Provider.find_by(user_id: session[:user_id], name: "github")
  end

  def create_github_client
    # @client = Octokit::Client.new(:access_token => find_provider.token)
    # line 25 is for if we needed to be authenticated
  end

end

# Octokit.search_users("book in:login")
# book = get it from the form
# searches the whole code and page
# shorthand for line 25
