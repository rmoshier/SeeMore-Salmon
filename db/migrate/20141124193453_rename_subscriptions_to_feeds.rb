class RenameSubscriptionsToFeeds < ActiveRecord::Migration
  def change
    rename_table :subscriptions, :feeds
  end
end
