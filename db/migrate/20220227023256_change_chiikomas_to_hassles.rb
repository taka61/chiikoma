class ChangeChiikomasToHassles < ActiveRecord::Migration[6.1]
  def change
    rename_table :chiikomas, :hassles
  end
end
