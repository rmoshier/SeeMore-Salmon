class RemoveTwitterUidFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :twitter_uid, :integer
  end
end
