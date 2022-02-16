# frozen_string_literal: true

class ChiikomasController < ApplicationController
  before_action :authenticate_user!

  def achievement
    today = Date.today
    @this_sunday = today - (today.wday - 0)
    @this_monday = today - (today.wday - 7)
    data = current_user.chiikomas
    @registration_numbers = data.where(is_made_by_admin: false).this_week.count
    @registration_points = data.this_week.sum(:registration_points)
    @solution_numbers = data.solved_on_this_week.count
    @solution_points = data.solved_on_this_week.sum(:total_points)
    @all_chiikoma_numbers = @registration_numbers + @solution_numbers
    @all_chiikoma_points = @registration_points + @solution_points

    @all_chiikomas_data = [
      {
        name: 'Solved',
        data: current_user.chiikomas.group_by_week(:solved_on).sum(:total_points)
      },
      {
        name: 'Registered',
        data: current_user.chiikomas.group_by_week(:created_at).sum(:registration_points)
      }
    ]
  end

  def done
    @chiikomas = current_user.chiikomas.where(done: true)
  end

  def show
    @chiikoma = current_user.chiikomas.find(params[:id])
  end


  private

  def chiikoma_params
    params.require(:chiikoma).permit(:title, :level_of_problem, :frequency_of_experience, :cost_of_solution,
                                     :total_points, :done, :solved_on)
  end
end
