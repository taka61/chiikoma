# frozen_string_literal: true

require 'application_system_test_case'

class ChiikomaNewTest < ApplicationSystemTestCase
  include Warden::Test::Helpers

  setup do
    @user = users(:otameshi)
    @chiikoma = chiikomas(:chiikoma1)
  end

  test 'create chiikoma' do
    login_as(@user, scope: :user)
    visit '/chiikomas/new'
    assert_text 'ちいこまの作成'
    fill_in 'title', with: 'メガネが汚れて見えづらい'
    choose '少し'
    choose '時々'
    choose 'すぐ'
    click_button '登録する'
    assert_text '登録した!'
  end

  test 'update chiikoma' do
    login_as(@user, scope: :user)
    visit edit_chiikoma_path(id: @chiikoma.id)
    assert_text 'ちいこまの編集'
    fill_in 'title', with: '空気清浄機の汚れが気になる'
    choose 'まあまあ'
    choose 'しばしば'
    choose '時間がかかる'
    click_button '更新する'
    assert_text '登録した!'
  end

  test 'delete chiikoma' do
    login_as(@user, scope: :user)
    visit chiikoma_path(id: @chiikoma.id)
    assert_text 'ちいこま詳細'
    click_button '削除'
    assert_text '登録した!'
  end

  test 'done chiikoma' do
    login_as(@user, scope: :user)
    visit chiikoma_path(id: @chiikoma.id)
    assert_text 'ちいこま詳細'
    assert_text '作成日'
    click_button 'ケアした'
    click_button '次へ'
    assert_text '解決した!'
  end

  test 'visit chiikoma page' do
    login_as(@user, scope: :user)
    visit chiikoma_path(id: @chiikoma.id)
    assert_text 'chiikoma1'
    assert_text '5'
    assert_text '5'
    assert_text '3'
    assert_text '13'
  end

  test 'achievement chiikoma' do
    login_as(@user, scope: :user)
    visit '/chiikomas/achievement'
    assert_text '1週間のがんばり'
    assert_text '合計ちいこま'
    assert_text '3'
    assert_text '49'
    assert_text '登録した!'
    assert_text '1'
    assert_text '5'
    assert_text '解決した!'
    assert_text '2'
    assert_text '44'
  end
end
