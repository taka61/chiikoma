# frozen_string_literal: true

class Chiikoma < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :level_of_problem, presence: true
  validates :frequency_of_experience, presence: true
  validates :cost_of_solution, presence: true

  scope :this_week, -> { where(created_at: Time.current.all_week) }

  scope :solved_on_this_week, -> { where(solved_on: Time.current.all_week) }

  def calculate_total_points
    level_of_problem + frequency_of_experience + cost_of_solution
  end

  def daytime
    today = Date.today
    @this_sunday = today - (today.wday - 0)
    @this_monday = today - (today.wday - 7)
  end
end
