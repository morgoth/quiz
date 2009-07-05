class TeacherExam < ActiveRecord::Base
  belongs_to :teacher
  has_many :exams
  has_and_belongs_to_many :teacher_questions

  # FIXME: duration includes only minutes - fix the form to not select hours
  validates_presence_of :teacher, :duration, :name
  validates_numericality_of :question_number, :only_integer => true, :allow_nil => true
  validate :size_of_question_number, :owner_of_question
  #validates_numericality_of :question_number, :greater_than_or_equal_to => :teacher_questions_size

  private

  def size_of_question_number
    errors.add(:question_number, "can not be greater than questions total") if question_number && question_number > teacher_questions_size
  end

  def owner_of_question
    teacher_questions.each do |question|
      unless teacher.teacher_questions.include?(question)
        errors.add(:teacher, "is not the owner of question #{question.content}")
      end
    end
  end

  def teacher_questions_size
    teacher_questions.try(:size) || 0
  end
end
