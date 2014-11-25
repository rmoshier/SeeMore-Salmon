class GithubsController < ApplicationController
  before_action :current_user

  def new
    find_provider
    create_github_client
  end

  def show
    create_github_client
    @search_results = @client.search_users("#{params[:q]} in:login")
  end

  def create
    @feed = Feed.find_by_uid(params[:feed_uid])

    if @feed
      current_user.subscriptions.create(feed_id: @feed.id)
    else
      current_user.feeds.create(provider: params["controller"],
                                uid: params[:feed_uid])
    end
    redirect_to root_path
  end

  private

  def find_provider
    @provider = Provider.find_by_user_id(session[:user_id])
  end

  def create_github_client
    @client = Octokit::Client.new(:access_token => find_provider.token)
  end

end
