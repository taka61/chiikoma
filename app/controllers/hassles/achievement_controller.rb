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
      @all_hassles_numbers = current_user.fetch_all_hassles_numbers
      @all_hassles_points = current_user.fetch_all_hassles_points
      @registration_hassles_and_solution_hassles = current_user.show_chart
    end

    private

    def display_one_week
      @this_monday = Time.current.beginning_of_week
      @this_sunday = Time.current.end_of_week
    end
  end
end
