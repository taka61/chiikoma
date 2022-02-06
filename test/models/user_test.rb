# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'the truth' do
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
end
