class Feed < ActiveRecord::Base
  has_many :posts
  has_many :subscriptions
  has_many :users, through: :subscriptions


  def work

  instagram_feeds = current_user.feeds.where(provider: "instagram")
  instagram_feeds.each do |feed|
    Instagram.client.user_recent_media(feed.uid.to_i).each do |ig|
      feed.posts.find_or_create_by(author_name: ig.full_name)
    end
  end

  end
end
