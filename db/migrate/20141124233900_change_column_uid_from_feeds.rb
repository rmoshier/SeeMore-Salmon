class ChangeColumnUidFromFeeds < ActiveRecord::Migration
  def change
    change_column :feeds, :uid, :string
  end
end
