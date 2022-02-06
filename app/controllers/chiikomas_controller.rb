# frozen_string_literal: true

class ChiikomasController < ApplicationController
  before_action :authenticate_user!

  def done
    @chiikomas = current_user.chiikomas.where(done: true)
  end

  def show
    @chiikoma = current_user.chiikomas.find(params[:id])
  end

  def destroy
    @chiikoma = current_user.chiikomas.find(params[:id])
    @chiikoma.destroy
    redirect_to chiikomas_path
  end

  private

  def chiikoma_params
    params.require(:chiikoma).permit(:title, :level_of_problem, :frequency_of_experience, :cost_of_solution,
                                     :total_points)
  end
end
