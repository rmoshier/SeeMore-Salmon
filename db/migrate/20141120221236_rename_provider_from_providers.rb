class RenameProviderFromProviders < ActiveRecord::Migration
  def change
    rename_column :providers, :provider, :name
  end
end
