# frozen_string_literal: true

module Api
  class HasslesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_hassle, only: %i[show edit update destroy]
    skip_before_action :verify_authenticity_token

    rescue_from ActiveRecord::RecordNotFound do |_exception|
      render json: { error: '404 not found' }, status: :not_found
    end

    def index
      @hassles = current_user.hassles.order(total_points: :desc)
      render json: @hassles
    end

    def show
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
      @hassle
    end

    def update
      if @hassle.update(hassle_params)
        render json: { status: 'SUCCESS', data: @hassle }
      else
        render json: { status: 'ERROR', data: @hassle.errors }
      end
    end

    def destroy
      @hassle.destroy
    end

    private

    def hassle_params
      params.require(:hassle).permit(:title, :difficulty_levels, :frequency, :cost,
                                     :total_points, :solved, :solved_on, :is_made_by_admin, :registration_points)
    end

    def set_hassle
      @hassle = current_user.hassles.find(params[:id])
    end
  end
end
