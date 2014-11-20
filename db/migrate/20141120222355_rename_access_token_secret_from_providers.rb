class RenameAccessTokenSecretFromProviders < ActiveRecord::Migration
  def change
    rename_column :providers, :access_token_secret, :secret
  end
end
