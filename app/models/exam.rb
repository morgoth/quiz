class Exam < ActiveRecord::Base
  belongs_to :student
  belongs_to :teacher_exam
  has_many :questions, :order => "position", :dependent => :destroy
  validates_presence_of :student, :teacher_exam

  after_create :set_teacher_questions

  def name
    teacher_exam.name
  end

  state_machine do
    event :prepare do
      transition nil => :prepared
    end

    event :start do
      transition [:prepared, :started] => :started
    end

    event :finish do
      transition :started => :finished
    end
  end

  def sum_points
    questions.map { |q| q.sum_points }.compact.inject { |sum, q| sum += q }
  end

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
