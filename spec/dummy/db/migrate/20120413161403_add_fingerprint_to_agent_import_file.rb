class AddFingerprintToAgentImportFile < ActiveRecord::Migration[4.2]
  def change
    add_column :agent_import_files, :agent_import_fingerprint, :string
  end
end
