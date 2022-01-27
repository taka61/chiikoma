# frozen_string_literal: true

class AddUserIdToChiikomas < ActiveRecord::Migration[6.1]
  def up
    add_reference :chiikomas, :user, null: false, index: true
  end

  def down
    remove_reference :chiikomas, :user, index: true
  end
end
