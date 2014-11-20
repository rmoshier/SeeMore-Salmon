class RemoveInstaUidFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :insta_uid, :integer
  end
end
