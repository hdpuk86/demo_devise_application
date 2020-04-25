require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def test_can_create_user
    assert User.new(
      email: 'test@example.com',
      display_name: 'name'
    )
  end
end
