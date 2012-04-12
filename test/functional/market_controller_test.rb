require 'test_helper'

class MarketControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_select '#columns #side a', :minimum => 2
    assert_select '#main .entry', 3
    assert_select 'h3', 'Ethnic'
    assert_select '.price', /[,\d]+\,\d\d\s&euro;/
  end

end
