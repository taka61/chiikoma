# frozen_string_literal: true

module Hassles
  class AchievementController < ApplicationController
    before_action :authenticate_user!

    def index
      display_one_week
      @registration_numbers = current_user.fetch_registration_numbers
      @registration_points = current_user.fetch_registration_points
      @solution_numbers = current_user.fetch_solution_numbers
      @solution_points = current_user.fetch_solution_points
      fetch_all_chiikoma
      @registration_chiikoma_and_solution_chiikoma = current_user.show_chart
    end

    def display_one_week
      @this_monday = Time.current.beginning_of_week
      @this_sunday = Time.current.end_of_week
    end

    def fetch_all_chiikoma
      @all_chiikoma_numbers = @registration_numbers + @solution_numbers
      @all_chiikoma_points = @registration_points + @solution_points
    end
  end
end
