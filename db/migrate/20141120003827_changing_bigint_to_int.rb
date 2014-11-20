class ChangingBigintToInt < ActiveRecord::Migration
  def change
    change_column :subscriptions, :subscribed_uid, :integer
  end
end
