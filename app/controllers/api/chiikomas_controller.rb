class Api::ChiikomasController < ApplicationController
  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { error: '404 not found' }, status: 404
  end

  def index
    chiikomas = current_user.chiikomas.where(done: false).order(total_points: :desc)
    render json: chiikomas
  end

end
