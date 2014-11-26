class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string   :provider
      t.string   :username
      t.string   :uid
      
      t.timestamps
    end
  end
end
