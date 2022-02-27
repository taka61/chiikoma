# frozen_string_literal: true

module Hassles
  class AchievementController < ApplicationController
    before_action :authenticate_user!

    def index
      @data = current_user.hassles
      format_date
      fetch_registration_info
      fetch_solution_info
      fetch_all_hassle_info
      show_chart
    end

    def format_date
      today = Time.zone.today
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

    def fetch_all_hassle_info
      @all_hassle_numbers = @registration_numbers + @solution_numbers
      @all_hassle_points = @registration_points + @solution_points
    end

    def show_chart
      @all_hassles_data = [
        {
          name: '解決した!',
          data: current_user.hassles.group_by_week(:solved_on).sum(:total_points)
        },
        {
          name: '登録した!',
          data: current_user.hassles.group_by_week(:created_at).sum(:registration_points)
        }
      ]
    end
  end
end
