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
    assert_text 'セルフケアしてほしいこと一覧'
  end

  test 'update chiikoma' do
    login_as(@user, scope: :user)
    visit edit_chiikoma_path(id: @chiikoma.id)
    assert_text 'ちいこまの編集'
    fill_in 'title', with: '空気清浄機の汚れが気になる'
    choose 'まあまあ'
    choose 'しばしば'
    choose '少し時間がかかる'
    click_button '更新する'
    assert_text 'セルフケアしてほしいこと一覧'
  end

  test 'done chiikoma' do
    login_as(@user, scope: :user)
    visit chiikoma_path(id: @chiikoma.id)
    assert_text 'ちいこまの詳細'
    click_link 'ケアした'
    assert_text 'セルフケアしたこと一覧'
  end

  test 'visit chiikoma page' do
    login_as(@user, scope: :user)
    visit chiikoma_path(id: @chiikoma.id)
    assert_text 'イヤホンが片方聞こえづらい'
    assert_text '少し'
    assert_text '時々'
    assert_text 'すぐ'
    assert_text '9'
  end
end
