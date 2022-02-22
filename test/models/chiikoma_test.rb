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

  test 'frequency_of_experience is left blank' do
    user = users(:otameshi)
    no_frequency_of_experience_chiikoma = Chiikoma.new(title: '困りごと', level_of_problem: '少し', frequency_of_experience: '',
                                                       cost_of_solution: 'すぐ', user: user)
    assert_not no_frequency_of_experience_chiikoma.valid?
  end

  test 'cost_of_solution is left blank' do
    user = users(:otameshi)
    no_cost_of_solution_chiikoma = Chiikoma.new(title: '困りごと', level_of_problem: '少し', frequency_of_experience: '時々',
                                                cost_of_solution: '', user: user)
    assert_not no_cost_of_solution_chiikoma.valid?
  end

  test 'calculate_total_points' do
    chiikoma = chiikomas(:chiikoma1)
    assert_equal chiikoma.total_points,
                 chiikoma.level_of_problem + chiikoma.frequency_of_experience + chiikoma.cost_of_solution
  end

  test 'registration_points' do
    chiikoma_made_by_admin = chiikomas(:chiikoma1)
    assert_nil nil, chiikoma_made_by_admin.registration_points

    chiikoma_made_by_user = chiikomas(:chiikoma2)
    assert_equal 5, chiikoma_made_by_user.registration_points
  end
end
