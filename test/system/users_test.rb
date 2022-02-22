# frozen_string_literal: true

require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase
  include Warden::Test::Helpers

  setup do
    @user = users(:otameshi)
  end

  test 'create account' do
    visit new_user_registration_path
    assert_text 'アカウント登録'
    fill_in '名前', with: 'てすてす'
    fill_in 'Eメール', with: 'test@sample.com'
    fill_in 'パスワード', with: 'testtest'
    fill_in 'パスワード（確認用）', with: 'testtest'
    click_button '登録する'
    assert_text 'アカウント登録が完了しました。'
  end

  test 'email that is already taken' do
    visit new_user_registration_path
    fill_in '名前', with: 'otameshi'
    fill_in 'Eメール', with: 'otameshi@sample.com'
    fill_in 'パスワード', with: 'password'
    fill_in 'パスワード（確認用）', with: 'password'
    click_button '登録する'
    assert_text 'Eメールはすでに存在します'
  end

  test 'Password and confirmation password do not match' do
    visit new_user_registration_path
    fill_in '名前', with: 'てすてす'
    fill_in 'Eメール', with: 'test@sample.com'
    fill_in 'パスワード', with: 'testtest'
    fill_in 'パスワード（確認用）', with: 'password'
    click_button '登録する'
    assert_text 'パスワード（確認用）とパスワードの入力が一致しません'
  end

  test 'visit home with login' do
    visit new_user_session_path
    assert_text 'ログイン'
    fill_in 'Eメール', with: 'otameshi@sample.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログインする'
    assert_text 'ログインしました'
  end

  test 'log in with wrong password' do
    visit new_user_session_path
    fill_in 'Eメール', with: 'otameshi@sample.com'
    fill_in 'パスワード', with: 'testdayo'
    click_button 'ログインする'
    assert_text 'Eメールまたはパスワードが違います。'
  end

  test 'logout' do
    login_as(@user, scope: :user)
    visit root_path
    click_button '閉じる'
    find(".navbar-link").click
    click_on 'ログアウト'
    assert_text 'ログアウトしました'
  end

  test 'email change' do
    login_as(@user, scope: :user)
    visit edit_user_registration_path
    assert_text 'ユーザー編集'
    fill_in 'Eメール', with: 'test@sample.com'
    fill_in '現在のパスワード（変更を保存する場合）', with: 'password'
    click_button '更新する'
    assert_text 'アカウント情報を変更しました。'
  end

  test 'update account with wrong password' do
    login_as(@user, scope: :user)
    visit edit_user_registration_path
    fill_in 'Eメール', with: 'test@sample.com'
    fill_in '現在のパスワード（変更を保存する場合）', with: 'testdayo'
    click_button '更新する'
    assert_text '現在のパスワードは不正な値です'
  end

  test 'account delete' do
    login_as(@user, scope: :user)
    visit edit_user_registration_path
    page.accept_confirm do
        click_on 'アカウント削除'
      end
    assert_text 'アカウントを削除しました。またのご利用をお待ちしております。'
  end
end
