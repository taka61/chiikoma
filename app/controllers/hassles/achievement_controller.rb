# frozen_string_literal: true

module Hassles
  class AchievementController < ApplicationController
    before_action :authenticate_user!

    def index
      display_one_week
      @registration_hassles_and_solution_hassles = current_user.show_chart
    end

    private

    def display_one_week
      @this_monday = Time.current.beginning_of_week
      @this_sunday = Time.current.end_of_week
    end
  end
end
