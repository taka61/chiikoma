# frozen_string_literal: true

require 'application_system_test_case'

class StaticPagesTest < ApplicationSystemTestCase
  test 'visit policy' do
    visit privacy_policy_path
    assert_text '本サービスは、ユーザーの個人情報の取扱いについて、以下のとおりプライバシーポリシー（以下、「本ポリシー」といいます。）を定めます。'
    assert_text '本サービスは、必要に応じて、このプライバシーポリシーの内容を変更します。'
  end

  test 'visit tos' do
    visit tos_path
    assert_text '本規約に従って、本サービスをご利用いただきます。'
    assert_text '本規約の解釈にあたっては、日本法を準拠法とします。'
  end
end
