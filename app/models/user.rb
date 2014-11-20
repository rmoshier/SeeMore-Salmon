class User < ActiveRecord::Base
  has_many :providers
  has_many :subscriptions
end
