class RenameAccessTokenFromProviders < ActiveRecord::Migration
  def change
    rename_column :providers, :access_token, :token
  end
end
