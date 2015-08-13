require 'test_helper'
  # def setup
  #   @user=users(:raji)
  #   login_as @user
  # end
class SigninTest < ActionDispatch::IntegrationTest
  test "invalid signin" do
    get root_path
    assert_select "#signin",count: 1
    assert_select "a[href=?]", logout_path, count: 0
    # assert_not is_logged_in?
    post login_path, session: {email: "",password: ""}
    assert_template 'static_pages/home'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
  test "valid signin and signout" do
    post login_path, session: {email: "rajeevriitm@gmail.com",password: "sadsad"}
    assert cookies[:user_id].nil?
    assert is_logged_in?
    follow_redirect!
    assert_select "a[href=?]", logout_path
    assert_select "#signin",count: 0
    assert_template 'users/show'
    delete logout_path
    assert_redirected_to root_path
    follow_redirect!
    assert_template 'static_pages/home'
    assert_select "#signin",count: 1
    assert_select "a[href=?]", logout_path, count: 0
  end
  test "remember user" do
    assert cookies["user_id"].nil?
    post login_path, session: {email: "rajeevriitm@gmail.com",password: "sadsad",remember: "1"}
    assert is_logged_in?
    assert_not users(:rajeev).remember_digest.nil?
    assert is_remembered?
    delete logout_path
    follow_redirect!
    assert_template 'static_pages/home'
    assert_not is_logged_in?

  end
  end
