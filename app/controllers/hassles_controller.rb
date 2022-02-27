# frozen_string_literal: true

class HasslesController < ApplicationController
  before_action :authenticate_user!

  def show
    @hassle = current_user.hassles.find(params[:id])
  end

  private

  def hassle_params
    params.require(:hassle).permit(:title, :difficulty_levels, :frequency, :cost,
                                     :total_points, :solved, :solved_on)
  end
end
