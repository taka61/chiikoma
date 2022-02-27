class RenameHasslesColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :hassles, :level_of_problem, :difficulty_levels
    rename_column :hassles, :frequency_of_experience, :frequency
    rename_column :hassles, :cost_of_solution, :cost
    rename_column :hassles, :done, :solved
  end
end
