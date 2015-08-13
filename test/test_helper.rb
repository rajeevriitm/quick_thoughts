 ENV['RAILS_ENV'] ||= 'test'
 require File.expand_path('../../config/environment', __FILE__)
 require 'rails/test_help'
 require "minitest/reporters"
 Minitest::Reporters.use!

 class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  def is_logged_in?
    !session[:user_id].nil?
  end
  def is_remembered?
    !cookies["user_id"].nil?
  end
  def login_as(user)
    session[:user_id]=user.id
  end

  # Add more helper methods to be used by all tests here...
end
