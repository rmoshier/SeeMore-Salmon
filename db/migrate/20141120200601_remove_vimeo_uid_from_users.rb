class RemoveVimeoUidFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :vimeo_uid, :integer
  end
end
