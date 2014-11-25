class SubscriptionsController < ApplicationController

  def create
    @feed = Feed.find_by_uid(params[:feed_uid])

    if @feed
      current_user.subscriptions.create(feed_id: @feed.id)
    else
      current_user.feeds.create(provider: "twitter",
                                username: "test",
                                uid: params[feed_uid],
                                )
    end
  end
end
