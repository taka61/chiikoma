# frozen_string_literal: true

require 'test_helper'

class Api::HasslesTest < ActionDispatch::IntegrationTest
  include Warden::Test::Helpers

  setup do
    @user = users(:otameshi)
  end

  test 'GET /api/hassles without login' do
    get api_hassles_path(format: :json)
    assert_response :unauthorized
  end

  test 'GET /api/hassles' do
    login_as(@user, scope: :user)
    get api_hassles_path(format: :json)
    assert_response :ok
  end
end
