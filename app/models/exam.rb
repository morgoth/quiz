class Exam < ActiveRecord::Base
  belongs_to :student
  belongs_to :teacher_exam
  has_many :questions, :order => "position", :dependent => :destroy
  validates_presence_of :student, :teacher_exam, :state

  # OPTIMIZE: do it using state machine callback
  after_create :set_teacher_questions

  delegate :name, :to => :teacher_exam

  state_machine do
    event :prepare do
      transition nil => :prepared
    end

    event :start do
      transition [:prepared, :started, :finished] => :started
    end

    event :finish do
      transition :started => :finished, :if => :time_to_finish?
      transition :started => :started
    end

    before_transition [:prepared, :finished] => :started, :do => :set_started_at
  end

  def sum_points
    questions.map { |q| q.sum_points }.compact.inject { |sum, q| sum += q }
  end

  private

  def set_started_at
    self.started_at = Time.now
  end

  def time_to_finish?
    (started_at + teacher_exam.duration.min*60).past?
  end

  def set_teacher_questions
    teacher_exam.teacher_questions.shuffle[0...question_number].each do |teacher_question|
      questions.create(:teacher_question_id => teacher_question.id)
    end
  end

  def question_number
    teacher_exam.try(:question_number) || teacher_exam.teacher_questions.size
  end
end
