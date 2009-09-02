class TeacherAnswer < ActiveRecord::Base
  belongs_to :teacher_question
  has_one :picture, :as => :imageable, :dependent => :destroy
  has_many :answers

  validates_numericality_of :points
  validates_presence_of :teacher_question
  validate_on_create :one_answer_only, :if => :text_field?

  before_destroy :destroyable?

  accepts_nested_attributes_for :picture

  def destroyable?
    answers.empty?
  end

  private

  def one_answer_only
    errors.add_to_base 'only one answer allowed for text field question' unless teacher_question.teacher_answers.empty?
  end

  def text_field?
    teacher_question.question_type == 'text_field'
  end
end
