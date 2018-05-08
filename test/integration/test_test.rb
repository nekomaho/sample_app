require 'test_helper'

class TestTest < ActionDispatch::IntegrationTest
 #sub_test_case 'call to_s method in power assert block' do
    test 'return true' do
      visit root_path
      assert do
        page.has_text? 1111.to_s
      end
    end
  #end
end
