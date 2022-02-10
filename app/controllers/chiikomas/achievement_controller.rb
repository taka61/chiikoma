# frozen_string_literal: true

module Chiikomas
  class AchievementController < ApplicationController
    def achievement
      @data1 = Date.current.strftime('%Y年 %m月 %d日')
    end
  end
end
