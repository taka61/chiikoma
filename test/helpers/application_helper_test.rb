require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test 'full title helper' do
    assert_equal full_title, 'Chiikoma'
    assert_equal full_title('ちいこま一覧'), 'ちいこま一覧 | Chiikoma'
  end
end
