require 'test_helper'

class SignupTest < ActionDispatch::IntegrationTest
  test "signup with invalid data" do
    get root_path
    assert_no_difference 'User.count' do
      post users_path , user: {name: "",email: "", password: "",password_confirmation: ""}
    end
    assert_template 'static_pages/home'
  end
  test "valid signup " do
    get root_path
    assert_not is_logged_in?
    assert_difference 'User.count' , 1  do
      post users_path , user: {name: "rajeev",email: "rajeev@email.com",
                                          password: "sadsad",password_confirmation: "sadsad"}
    end
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end

  end
