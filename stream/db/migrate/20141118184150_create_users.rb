class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :twitter_uid
      t.integer :insta_uid
      t.integer :vimeo_uid
      t.integer :github_uid

      t.timestamps
    end
  end
end
