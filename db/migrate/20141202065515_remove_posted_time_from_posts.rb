class RemovePostedTimeFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :posted_time, :string
  end
end
