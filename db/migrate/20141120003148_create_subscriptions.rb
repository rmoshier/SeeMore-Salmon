class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :user_id
      t.string :provider
      t.string :username
      t.integer :subscribed_uid

      t.timestamps
    end
  end
end
