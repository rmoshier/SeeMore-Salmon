class RemoveGitHubUidFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :github_uid, :integer
  end
end
