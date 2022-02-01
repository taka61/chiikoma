class Api::ChiikomasController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { error: '404 not found' }, status: 404
  end

  def index
    @chiikomas = current_user.chiikomas.where(done: false).order(total_points: :desc)
    render json: @chiikomas
  end

  def new
    @chiikoma = Chiikoma.new
  end

  def create
    @chiikoma = current_user.chiikomas.create(chiikoma_params)
    @chiikoma.total_points = @chiikoma.calculate_total_points

    if @chiikoma.save
      render json: @chiikoma, status: :created
    else
      render json: @chiikoma.errors, status: :unprocessable_entity
    end
  end

  private

  def chiikoma_params
    params.require(:chiikoma).permit(:title, :level_of_problem, :frequency_of_experience, :cost_of_solution, :total_points)
  end
end
