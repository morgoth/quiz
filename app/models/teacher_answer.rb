class TeacherAnswer < ActiveRecord::Base
  belongs_to :teacher_question

  validates_numericality_of :points
  validates_presence_of :teacher_question
end
