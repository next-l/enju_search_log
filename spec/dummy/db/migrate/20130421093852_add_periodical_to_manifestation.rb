class AddPeriodicalToManifestation < ActiveRecord::Migration[4.2]
  def change
    add_column :manifestations, :periodical, :boolean
  end
end
