class Exam < ActiveRecord::Base
  belongs_to :student
  belongs_to :teacher_exam
  has_many :questions
  validates_presence_of :student, :teacher_exam

  after_create :set_teacher_questions

  private

  def set_teacher_questions
    teacher_exam.teacher_questions.shuffle[0...question_number].each do |teacher_question|
      questions.create(:teacher_question_id => teacher_question.id)
    end
  end

  def question_number
    teacher_exam.try(:question_number) || teacher_exam.teacher_questions.size
  end
end
