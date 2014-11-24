class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :feed_id
      t.string :author_name
      t.string :author_handle
      t.string :author_profile_pic
      t.string :content
      t.string :uid

      t.timestamps
    end
  end
end
