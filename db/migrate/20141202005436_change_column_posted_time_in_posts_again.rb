class ChangeColumnPostedTimeInPostsAgain < ActiveRecord::Migration
  def change
    change_column :posts, :posted_time, :string
  end
end
