class AddCreatedAtToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :posted_time, :time
  end
end
