# frozen_string_literal: true

module Hassles
  class AchievementController < ApplicationController
    before_action :authenticate_user!

    def index
      @hassles = current_user.hassles
      format_date
      fetch_registration_chiikoma
      fetch_solution_chiikoma
      fetch_all_chiikoma
      show_chart
    end

    def format_date
      @this_monday = Time.current.beginning_of_week
      @this_sunday = Time.current.end_of_week
    end

    def fetch_registration_chiikoma
      @registration_numbers = @hassles.where(is_made_by_admin: false).this_week.count
      @registration_points = @hassles.this_week.sum(:registration_points)
    end

    def fetch_solution_chiikoma
      @solution_numbers = @hassles.solved_on_this_week.count
      @solution_points = @hassles.solved_on_this_week.sum(:total_points)
    end

    def fetch_all_chiikoma
      @all_chiikoma_numbers = @registration_numbers + @solution_numbers
      @all_chiikoma_points = @registration_points + @solution_points
    end

    def show_chart
      @registration_chiikoma_and_solution_chiikoma = [
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
