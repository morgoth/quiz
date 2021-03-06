class User < ActiveRecord::Base
  validate_on_update :login_not_changed

  attr_accessible :login, :password, :password_confirmation, :first_name, :last_name

  acts_as_authentic do |config|
    config.validates_length_of_login_field_options = { :in => 3..64 }
    config.validates_format_of_login_field_options = { :with => /^[a-zA-Z0-9]+$/ }
  end

  def teacher?
    type == 'Teacher'
  end

  def student?
    type == 'Student'
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def login_not_changed
    errors.add :login, :changed if login_changed?
  end
end
