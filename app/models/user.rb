# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :hassles, dependent: :destroy

  def fetch_registration_numbers
    hassles.where(is_made_by_admin: false).this_week.count
  end

  def fetch_registration_points
    hassles.this_week.sum(:registration_points)
  end

  def fetch_solution_numbers
    hassles.solved_on_this_week.count
  end

  def fetch_solution_points
    hassles.solved_on_this_week.sum(:total_points)
  end

  def show_chart
    [
      {
        name: '解決した!',
        data: hassles.within_3_months.group_by_week(:solved_on).sum(:total_points)
      },
      {
        name: '登録した!',
        data: hassles.within_3_months.group_by_week(:created_at).sum(:registration_points)
      }
    ]
  end
end
