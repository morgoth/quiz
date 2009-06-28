class User < ActiveRecord::Base
  acts_as_authentic

  attr_accessible :login, :password, :password_confirmation

  def teacher?
    type == 'Teacher'
  end

  def student?
    type == 'Student'
  end
end
