class User < ActiveRecord::Base
  acts_as_authentic

  attr_accessible :password, :pasword_confirmation

  def teacher?
     type == 'Teacher'
   end

   def student?
     type == 'Student'
   end
end
