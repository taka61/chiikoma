# frozen_string_literal: true

class AddRegistrationPointsToChiikomas < ActiveRecord::Migration[6.1]
  def change
    add_column :chiikomas, :registration_points, :integer
  end
end
