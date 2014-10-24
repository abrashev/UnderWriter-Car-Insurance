require 'test_helper'

class UserTest < ActiveSupport::TestCase

fixtures :users

test "invalid with empty attributes" do
    user = User.new
	user.user_detail = UserDetail.new
    assert !user.valid? # Assert that user.errors is not empty
    assert user.errors[:firstname].any?
    assert user.errors[:surname].any?
    assert user.errors[:dateofbirth].any?
	end
end
