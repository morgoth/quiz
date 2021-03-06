class TeacherQuestion < ActiveRecord::Base
  QUESTION_TYPES = ['radio_button', 'check_box', 'text_field'].freeze
  acts_as_taggable_on :tags

  has_and_belongs_to_many :teacher_exams
  belongs_to :teacher
  has_many :teacher_answers, :dependent => :destroy
  has_many :questions

  validates_inclusion_of :question_type, :in => QUESTION_TYPES
  validate_on_update :question_type_not_changed

  before_destroy :destroyable?

  accepts_nested_attributes_for :teacher_answers, :allow_destroy => true

  def max_points
    if question_type == 'radio_button'
      teacher_answers.map { |a| a.points }.compact.max
    else
      teacher_answers.map { |a| a.points if a.points > 0 }.compact.inject { |sum, p| sum += p }
    end
  end

  def destroyable?
    questions.empty?
  end

  private

  def question_type_not_changed
    errors.add :question_type, :changed if question_type_changed?
  end
end
