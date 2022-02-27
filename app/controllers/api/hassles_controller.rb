# frozen_string_literal: true

module Api
  class HasslesController < ApplicationController
    before_action :authenticate_user!
    skip_before_action :verify_authenticity_token

    rescue_from ActiveRecord::RecordNotFound do |_exception|
      render json: { error: '404 not found' }, status: :not_found
    end

    def index
      @hassles = current_user.hassles.where(done: false).order(total_points: :desc)
      render json: @hassles
    end

    def done
      @hassles = current_user.hassles.where(done: true).order(total_points: :desc)
      render json: @hassles
    end

    def show
      @hassle = current_user.hassles.find(params[:id])
      render json: @hassle
    end

    def new
      @hassle = Hassle.new
    end

    def create
      @hassle = current_user.hassles.create(hassle_params)

      if @hassle.save
        render json: @hassle, status: :created
      else
        render json: @hassle.errors, status: :unprocessable_entity
      end
    end

    def edit
      @hassle = current_user.hassles.find(params[:id])
    end

    def update
      @hassle = current_user.hassles.find(params[:id])

      if @hassle.update(hassle_params)
        render json: { status: 'SUCCESS', data: @hassle }
      else
        render json: { status: 'ERROR', data: @hassle.errors }
      end
    end

    def destroy
      @hassle = current_user.hassles.find(params[:id])
      @hassle.destroy
    end

    private

    def hassle_params
      params.require(:hassle).permit(:title, :level_of_problem, :frequency_of_experience, :cost_of_solution,
                                       :total_points, :done, :solved_on, :is_made_by_admin, :registration_points)
    end
  end
end
