require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
def setup
    @user = users(:one)
  end

  def test_should_get_index
    sign_in @user

    get users_url
    assert_response :success
  end

  def test_should_not_get_index__unauthorised
    get users_url
    assert_redirected_to new_user_session_path
  end

  def test_should_show_user
    sign_in @user

    get user_url(@user)
    assert_response :success
  end

  def test_should_not_show_user__unauthorised
    get user_url(@user)
    assert_redirected_to new_user_session_path
  end

  def test_should_get_edit
    sign_in @user

    get edit_user_url(@user)
    assert_response :success
  end

  def test_should_get_edit__unauthorised
    get edit_user_url(@user)
    assert_redirected_to new_user_session_path
  end

  def test_should_update_user
    sign_in @user

    patch user_url(@user), params: { user: {
      display_name: 'new_name'
    } }
    assert_redirected_to user_url(@user)
    assert_equal 'new_name', @user.reload.display_name
  end

  def test_should_update_user__unauthorised
    patch user_url(@user), params: { user: {
      display_name: 'new_name'
    } }
    assert_redirected_to new_user_session_path
    assert_not_equal 'new_name', @user.reload.display_name
  end
end
