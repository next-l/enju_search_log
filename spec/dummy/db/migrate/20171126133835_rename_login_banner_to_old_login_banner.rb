class RenameLoginBannerToOldLoginBanner < ActiveRecord::Migration[4.2]
  def change
    rename_column :library_groups, :login_banner, :old_login_banner
  end
end
