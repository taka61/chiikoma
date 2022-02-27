class RemoveIsMadeByAdminFromHassles < ActiveRecord::Migration[6.1]
  def change
    remove_column :hassles, :is_made_by_admin
  end
end
