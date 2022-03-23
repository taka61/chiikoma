# frozen_string_literal: true

module Hassles
  class AchievementController < ApplicationController
    before_action :authenticate_user!

    def index; end
  end
end
