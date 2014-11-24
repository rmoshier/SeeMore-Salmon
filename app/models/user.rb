class User < ActiveRecord::Base
  has_many :providers
  has_and_belongs_to_many :feeds
end
