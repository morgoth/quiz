class TeacherQuestion < ActiveRecord::Base
  has_and_belongs_to_many :teacher_exams
  has_many :teacher_answers
  has_many :questions
end
