class User < ActiveRecord::Base
  has_many :providers
  has_many :subscriptions
  has_many :feeds, through: :subscriptions
  has_many :posts, through: :feeds
end
