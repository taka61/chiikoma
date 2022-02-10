# frozen_string_literal: true

class AddSolvedOnToChiikomas < ActiveRecord::Migration[6.1]
  def change
    add_column :chiikomas, :solved_on, :date
  end
end
