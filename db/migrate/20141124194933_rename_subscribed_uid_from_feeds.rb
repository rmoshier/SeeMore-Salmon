class RenameSubscribedUidFromFeeds < ActiveRecord::Migration
  def change
    rename_column :feeds, :subscribed_uid, :feed_uid
  end
end
