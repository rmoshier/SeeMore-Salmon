class RenameFeedUidFromFeeds < ActiveRecord::Migration
  def change
    rename_column :feeds, :feed_uid, :uid
  end
end
