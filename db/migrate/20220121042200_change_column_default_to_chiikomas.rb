# frozen_string_literal: true

class ChangeColumnDefaultToChiikomas < ActiveRecord::Migration[6.1]
  def change
    change_column :chiikomas, :done, :boolean, default: false, null: false
    change_column :chiikomas, :is_made_by_admin, :boolean, default: false, null: false
  end
end
