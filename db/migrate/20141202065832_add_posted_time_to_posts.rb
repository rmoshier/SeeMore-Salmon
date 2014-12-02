class AddPostedTimeToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :posted_time, :timestamp
  end
end
