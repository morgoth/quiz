class Teacher < User
  has_many :teacher_exams
  has_many :student_imports
end
