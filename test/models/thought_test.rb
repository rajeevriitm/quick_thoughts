require 'test_helper'

class ThoughtTest < ActiveSupport::TestCase
  def setup
    @user=users(:rajeev)
    @thought=Thought.new(user_id: @user.id, content: "cool")
  end
  test "content present" do
    @thought.content=""
    assert_not @thought.valid?
  end
  test "user  present" do
    @thought.user_id=nil
    assert_not @thought.valid?
  end
  test "valid thought" do
    assert @thought.valid?
  end
end
