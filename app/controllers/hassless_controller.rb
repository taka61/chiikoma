# frozen_string_literal: true

class HasslesController < ApplicationController
  before_action :authenticate_user!

  def show
    @hassle = current_user.hassles.find(params[:id])
  end

  private

  def hassle_params
    params.require(:hassle).permit(:title, :level_of_problem, :frequency_of_experience, :cost_of_solution,
                                     :total_points, :done, :solved_on)
  end
end
