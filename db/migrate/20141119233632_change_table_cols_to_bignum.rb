class ChangeTableColsToBignum < ActiveRecord::Migration
  def change
    change_column :users, :twitter_uid, :bigint
    change_column :users, :insta_uid, :bigint
    change_column :users, :github_uid, :bigint
    change_column :users, :vimeo_uid, :bigint
  end
end
