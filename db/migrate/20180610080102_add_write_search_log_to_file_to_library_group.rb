class AddWriteSearchLogToFileToLibraryGroup < ActiveRecord::Migration[5.1]
  def change
    add_column :library_groups, :write_search_log_to_file, :boolean, default: false, null: false
  end
end
