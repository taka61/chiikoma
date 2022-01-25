# frozen_string_literal: true

class ChiikomasController < ApplicationController
  before_action :authenticate_user!

  def index
    @chiikomas = current_user.chiikomas.where(done: false).order(total_points: :desc)
  end

  def done
    @chiikomas = current_user.chiikomas.where(done: true)
  end

  def show
    @chiikoma = current_user.chiikomas.find(params[:id])
  end

  def new
    @chiikoma = Chiikoma.new
  end

  def create
    @chiikoma = current_user.chiikomas.create(chiikoma_params)
    @chiikoma.total_points = @chiikoma.calculate_total_points
    if @chiikoma.save!
      redirect_to chiikomas_path, notice: "ちいこま「#{@chiikoma.title}」を登録しました。"
    else
      render :new
    end
  end

  def edit
    @chiikoma = current_user.chiikomas.find(params[:id])
  end

  def update
    @chiikoma = current_user.chiikomas.find(params[:id])
    @chiikoma.update!(chiikoma_params)
    redirect_to chiikomas_path
  end

  def destroy
    @chiikoma = current_user.chiikomas.find(params[:id])
    @chiikoma.destroy
    redirect_to chiikomas_path
  end

  private

  def chiikoma_params
    params.require(:chiikoma).permit(:title, :level_of_problem, :frequency_of_experience, :cost_of_solution)
  end
end
