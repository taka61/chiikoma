# frozen_string_literal: true

class AddTotalPointsTochiikomas < ActiveRecord::Migration[6.1]
  def change
    add_column :chiikomas, :total_points, :integer
  end
end
