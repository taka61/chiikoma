# frozen_string_literal: true

class ChiikomasController < ApplicationController
  before_action :authenticate_user!

  def show
    @chiikoma = current_user.chiikomas.find(params[:id])
  end

  private

  def chiikoma_params
    params.require(:chiikoma).permit(:title, :level_of_problem, :frequency_of_experience, :cost_of_solution,
                                     :total_points, :done, :solved_on)
  end
end
