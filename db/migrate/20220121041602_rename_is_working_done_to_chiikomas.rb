# frozen_string_literal: true

class RenameIsWorkingDoneToChiikomas < ActiveRecord::Migration[6.1]
  def change
    rename_column :chiikomas, :is_working, :done
    rename_column :chiikomas, :is_made_by_user, :is_made_by_admin
  end
end
