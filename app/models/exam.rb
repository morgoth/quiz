class Exam < ActiveRecord::Base
  belongs_to :student
  belongs_to :teacher_exam
  has_many :questions, :order => "position", :dependent => :destroy
  validates_presence_of :student, :teacher_exam, :state

  delegate :name, :start_date, :duration, :to => :teacher_exam
  delegate :login, :to => :student, :prefix => true

  state_machine do
    event :prepare do
      transition nil => :prepared
    end

    event :start do
      transition [:prepared, :started, :finished] => :started, :if => :time_to_start?
    end

    event :try_finish do
      transition :started => :finished, :if => :time_to_finish?
    end

    event :finish do
      transition any => :finished
    end

    after_transition nil => :prepared, :do => :set_teacher_questions
    before_transition [:prepared, :finished] => :started, :do => :set_started_at
  end

  def sum_points
    questions.map { |q| q.sum_points }.compact.inject { |sum, q| sum += q }
  end

  def percentage_score
    ((sum_points / teacher_exam.max_points) * 100).round
  end

  private

  def set_started_at
    self.started_at = Time.now
  end

  def time_to_start?
    teacher_exam.start_date.nil? ? true : teacher_exam.start_date.past?
  end

  def time_to_finish?
    (started_at + teacher_exam.duration * 60).past?
  end

  def set_teacher_questions
    teacher_exam.teacher_questions.shuffle[0...exam_question_number].each do |teacher_question|
      questions.create!(:teacher_question => teacher_question, :state_event => 'prepare')
    end
  end

  def exam_question_number
    teacher_exam.try(:question_number) || teacher_exam.teacher_questions.count
  end
end
