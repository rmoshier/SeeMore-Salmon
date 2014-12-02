class GithubsController < ApplicationController
  before_action :current_user

  def index
  end

  def new
    find_provider
    create_github_client
  end

  def show
    create_github_client
    @search_results = @client.search_users("#{params[:q]} in:login")
  end

  def create
    @feed = Feed.find_by_uid(params[:uid])

    if @feed
      current_user.subscriptions.create(feed_id: @feed.id)
    else
      current_user.feeds.create(username: params["username"], uid: params["uid"], provider: params["provider"])
    end
    redirect_to root_path
  end

  def feed
    create_github_client
    # @variable = Octokit.user_events("rmoshier")
    find_provider
    @client = Octokit::Client.new(:access_token => find_provider.token)
    github_feeds = current_user.feeds.where(provider: "github")
    github_feeds.each do |feed|
      Octokit.user_events(feed.uid.to_i).each do |event|
        # raise
        feed.posts.find_or_create_by(
        author_handle: event[:actor][:login],
        author_profile_pic: event[:actor][:avatar_url],
        content: event[:repo][:name]
      )
      end
    end
    # @posts = current_user.posts.limit(20)
  end

  private

  def find_provider
    @provider = Provider.find_by_name_and_user_id("github", session[:user_id])
  end

  def create_github_client
    @client = Octokit::Client.new(:access_token => find_provider.token)
  end

end
