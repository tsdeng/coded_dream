require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end

  test "should_not_save_when_user_name_is_duplicated" do
    user=User.new(:username=>"MyString2",:password=>"asdfasfdsa")
    assert !user.save()
  end

  test "should_not_save_when_user_name_is_too_short" do
    user=User.new(:username=>"My",:password=>"asdfasfdsa")
    puts "aaaaaaaaaaaaaaaa!!!!!!!!!!!!!!"
    p users(:one)
    assert !user.save()
  end
end
