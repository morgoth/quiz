class Teacher < User
  has_many :teacher_exams
  has_many :student_imports
  has_many :mass_exams
  has_many :teacher_questions
end
