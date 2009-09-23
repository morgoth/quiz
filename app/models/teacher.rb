class Teacher < User
  acts_as_tagger
  has_many :teacher_exams
  has_many :student_imports
  has_many :mass_exams
  has_many :teacher_questions
end
