# frozen_string_literal: true

module Chiikomas
  class StatusController < ApplicationController
    def create
      @chiikoma = current_user.chiikomas.find(params[:chiikoma_id])
      @chiikoma.update!(solved_on: Date.today, done: true) if @chiikoma.done == false
      redirect_to done_chiikomas_path, notice: 'ケアしました'
    end
  end
end
