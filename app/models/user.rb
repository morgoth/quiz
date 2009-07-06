class User < ActiveRecord::Base
  acts_as_authentic

  attr_accessible :login, :password, :password_confirmation
  validate_on_update :login_not_changed

  def teacher?
    type == 'Teacher'
  end

  def student?
    type == 'Student'
  end

  private

  def login_not_changed
    errors.add :login, "can not be changed" if login_changed?
  end
end
