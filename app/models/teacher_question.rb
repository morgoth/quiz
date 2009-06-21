class TeacherQuestion < ActiveRecord::Base
  has_and_belongs_to_many :teacher_exams
  has_many :teacher_answers
  has_many :questions
  accepts_nested_attributes_for :teacher_answers, :allow_destroy => true

  QUESTION_TYPES = %w{radio_button check_box}

  validates_inclusion_of :question_type, :in => QUESTION_TYPES, :allow_blank => true

end
