class TeacherAnswer < ActiveRecord::Base
  belongs_to :teacher_question

  validates_numericality_of :points
end
