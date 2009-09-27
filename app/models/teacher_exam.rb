class TeacherExam < ActiveRecord::Base
  belongs_to :teacher
  has_many :exams
  has_and_belongs_to_many :teacher_questions

  validates_presence_of :teacher, :name
  validates_numericality_of :question_number, :only_integer => true, :allow_nil => true
  validates_numericality_of :duration, :only_integer => true, :greater_than => 0
  validate :size_of_question_number, :if => :question_number
  validate :owner_of_question

  before_destroy :destroyable?

  delegate :login, :to => :teacher, :prefix => true
  delegate :login, :to => :student, :prefix => true

  def max_points
    teacher_questions.map { |q| q.max_points }.compact.inject { |sum, q| sum += q }
  end

  def destroyable?
    exams.empty?
  end

  private

  def size_of_question_number
    errors.add(:question_number, :greater_than_total) if question_number > teacher_questions_size
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
