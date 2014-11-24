class CreateFeedsUsersJoinTable < ActiveRecord::Migration
  def change
    create_table :subscriptions, id: false do |t|
      t.integer :feed_id
      t.integer :user_id
    end
  end
end
