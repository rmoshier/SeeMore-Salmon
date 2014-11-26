class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.integer  :user_id
      t.string   :name
      t.string   :uid
      t.string   :token
      t.string   :secret

      t.timestamps    
    end
  end
end
