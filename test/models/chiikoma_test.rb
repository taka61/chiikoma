# frozen_string_literal: true

require 'test_helper'

class ChiikomaTest < ActiveSupport::TestCase
  test 'the truth' do
    user = users(:otameshi)
    new_chiikoma = Chiikoma.new(title: '困りごと', level_of_problem: '少し', frequency_of_experience: '時々',
                                cost_of_solution: 'すぐ', user: user)
    assert new_chiikoma.valid?
  end

  test 'title is left blank' do
    user = users(:otameshi)
    no_title_chiikoma = Chiikoma.new(title: '', level_of_problem: '少し', frequency_of_experience: '時々',
                                     cost_of_solution: 'すぐ', user: user)
    assert_not no_title_chiikoma.valid?
  end

  test 'level_of_problem is left blank' do
    user = users(:otameshi)
    no_level_of_problem_chiikoma = Chiikoma.new(title: '困りごと', level_of_problem: '', frequency_of_experience: '時々',
                                                cost_of_solution: 'すぐ', user: user)
    assert_not no_level_of_problem_chiikoma.valid?
  end

  test 'calculate_total_points' do
    chiikoma = chiikomas(:chiikoma1)
    assert_equal 13, chiikoma.total_points
  end
end
