# frozen_string_literal: true

require 'test_helper'

class HassleTest < ActiveSupport::TestCase
  test 'the truth' do
    user = users(:otameshi)
    new_hassle = Hassle.new(title: '困りごと', difficulty_levels: '少し', frequency: '時々',
                            cost: 'すぐ', user: user)
    assert new_hassle.valid?
  end

  test 'title is left blank' do
    user = users(:otameshi)
    no_title_hassle = Hassle.new(title: '', difficulty_levels: '少し', frequency: '時々',
                                 cost: 'すぐ', user: user)
    assert_not no_title_hassle.valid?
  end

  test 'difficulty_levels is left blank' do
    user = users(:otameshi)
    no_difficulty_levels_hassle = Hassle.new(title: '困りごと', difficulty_levels: '', frequency: '時々',
                                             cost: 'すぐ', user: user)
    assert_not no_difficulty_levels_hassle.valid?
  end

  test 'frequency is left blank' do
    user = users(:otameshi)
    no_frequency_hassle = Hassle.new(title: '困りごと', difficulty_levels: '少し', frequency: '',
                                     cost: 'すぐ', user: user)
    assert_not no_frequency_hassle.valid?
  end

  test 'cost is left blank' do
    user = users(:otameshi)
    no_cost_hassle = Hassle.new(title: '困りごと', difficulty_levels: '少し', frequency: '時々',
                                cost: '', user: user)
    assert_not no_cost_hassle.valid?
  end

  test 'calculate_total_points' do
    hassle = hassles(:chiikoma1)
    assert_equal hassle.total_points,
                 hassle.difficulty_levels + hassle.frequency + hassle.cost
  end

  test 'registration_points' do
    hassle_made_by_admin = hassles(:chiikoma1)
    assert_nil nil, hassle_made_by_admin.registration_points

    hassle_made_by_user = hassles(:chiikoma2)
    assert_equal 5, hassle_made_by_user.registration_points
  end
end
