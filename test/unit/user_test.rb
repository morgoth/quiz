require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should "not allow to change login" do
    user = Factory(:student, :login => 'johndoe')
    user.login = 'changed'
    assert !user.valid?
    assert user.errors.invalid? :login
  end
end
