# frozen_string_literal: true

class Chiikomas::AchievementController < ApplicationController
  def index
    @data = current_user.chiikomas
    format_date
    fetch_registration_info
    fetch_solution_info
    fetch_all_chiikoma_info
    show_chart
  end

  def format_date
    today = Date.today
    @this_sunday = today - (today.wday - 0)
    @this_monday = today - (today.wday - 7)
  end

  def fetch_registration_info
    @registration_numbers = @data.where(is_made_by_admin: false).this_week.count
    @registration_points = @data.this_week.sum(:registration_points)
  end

  def fetch_solution_info
    @solution_numbers = @data.solved_on_this_week.count
    @solution_points = @data.solved_on_this_week.sum(:total_points)
  end

  def fetch_all_chiikoma_info
    @all_chiikoma_numbers = @registration_numbers + @solution_numbers
    @all_chiikoma_points = @registration_points + @solution_points
  end

  def show_chart
    @all_chiikomas_data = [
      {
        name: '解決した!',
        data: current_user.chiikomas.group_by_week(:solved_on).sum(:total_points)
      },
      {
        name: '登録した!',
        data: current_user.chiikomas.group_by_week(:created_at).sum(:registration_points)
      }
    ]
  end

end
