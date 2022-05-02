# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:otameshi)
  end

  test 'email address and password are filled in' do
    user = User.new(name: 'sample', email: 'sample@example.com', password: 'password')
    assert user.valid?
  end

  test 'email address is left blank' do
    no_email_user = User.new(name: 'sample', email: '', password: 'password')
    assert_not no_email_user.valid?
  end

  test 'password is left blank' do
    no_password_user = User.new(name: 'sample', email: 'sample@example.com', password: '')
    assert_not no_password_user.valid?
  end

  test 'calculate number of registrations' do
    assert_equal 1, @user.fetch_registration_numbers
  end

  test 'calculate point of registrations' do
    assert_equal 5, @user.fetch_registration_points
  end

  test 'calculate number of solutions' do
    assert_equal 2, @user.fetch_solution_numbers
  end

  test 'calculate point of solutions' do
    assert_equal 45, @user.fetch_solution_points
  end

  test 'calculate numbers of all hassles' do
    assert_equal 3, @user.fetch_all_hassles_numbers
  end

  test 'calculate point of all hassles' do
    assert_equal 50, @user.fetch_all_hassles_points
  end
end
