class User < ActiveRecord::Base
  acts_as_authentic

  def teacher?
     type == 'Teacher'
   end

   def student?
     type == 'Student'
   end
end
