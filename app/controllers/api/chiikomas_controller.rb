# frozen_string_literal: true

module Api
  class ChiikomasController < ApplicationController
    before_action :authenticate_user!
    skip_before_action :verify_authenticity_token

    rescue_from ActiveRecord::RecordNotFound do |_exception|
      render json: { error: '404 not found' }, status: 404
    end

    def index
      @chiikomas = current_user.chiikomas.where(done: false).order(total_points: :desc)
      render json: @chiikomas
    end

    def done
      @chiikomas = current_user.chiikomas.where(done: true).order(total_points: :desc)
      render json: @chiikomas
    end

    def show
      @chiikoma = current_user.chiikomas.find(params[:id])
      render json: @chiikoma
    end

    def new
      @chiikoma = Chiikoma.new
    end

    def create
      @chiikoma = current_user.chiikomas.create(chiikoma_params)
      @chiikoma.total_points = @chiikoma.calculate_total_points
      @chiikoma.registration_points = 5 if @chiikoma.is_made_by_admin == false

      if @chiikoma.save
        render json: @chiikoma, status: :created
      else
        render json: @chiikoma.errors, status: :unprocessable_entity
      end
    end

    def edit
      @chiikoma = current_user.chiikomas.find(params[:id])
    end

    def update
      @chiikoma = current_user.chiikomas.find(params[:id])

      if @chiikoma.update(chiikoma_params)
        render json: { status: 'SUCCESS', data: @chiikoma }
      else
        render json: { status: 'ERROR', data: @chiikoma.errors }
      end
    end

    private

    def chiikoma_params
      params.require(:chiikoma).permit(:title, :level_of_problem, :frequency_of_experience, :cost_of_solution,
                                       :total_points, :done, :solved_on)
    end
  end
end
