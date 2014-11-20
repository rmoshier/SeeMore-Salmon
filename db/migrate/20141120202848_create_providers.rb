class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.integer :user_id
      t.string :provider
      t.string :uid
      t.string :access_token
      t.string :access_token_secret

      t.timestamps
    end
  end
end
