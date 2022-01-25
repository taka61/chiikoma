# frozen_string_literal: true

class CreateChiikomas < ActiveRecord::Migration[6.1]
  def change
    create_table :chiikomas do |t|
      t.string :title, null: false
      t.integer :level_of_problem, null: false
      t.integer :frequency_of_experience, null: false
      t.integer :cost_of_solution, null: false
      t.boolean :is_working
      t.boolean :is_made_by_user
      t.timestamps
    end
  end
end
