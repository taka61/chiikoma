# frozen_string_literal: true

class Chiikoma < ApplicationRecord
  belongs_to :user

  enum level_of_problem: { 少し: 3, まあまあ: 5, かなり: 7, もうムリ: 10 }
  enum frequency_of_experience: { 時々: 3, しばしば: 5, 頻繁: 7, 常に: 10 }
  enum cost_of_solution: { すぐ: 3, 少し時間がかかる: 5, 時間がかかる: 8 }

  validates :title, presence: true
  validates :level_of_problem, presence: true
  validates :frequency_of_experience, presence: true
  validates :cost_of_solution, presence: true

  def calculate_total_points
    level_of_problem_before_type_cast + frequency_of_experience_before_type_cast + cost_of_solution_before_type_cast
  end
end
