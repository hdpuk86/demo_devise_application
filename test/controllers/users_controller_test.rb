require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
def setup
    @user = users(:one)
    sign_in @user
  end

  def test_should_get_index
    get users_url
    assert_response :success
  end

  def test_should_show_user
    get user_url(@user)
    assert_response :success
  end

  def test_should_get_edit
    get edit_user_url(@user)
    assert_response :success
  end

  def test_should_update_user
    patch user_url(@user), params: { user: {
      display_name: 'name'
    } }
    assert_redirected_to user_url(@user)
  end
end
