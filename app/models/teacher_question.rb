class TeacherQuestion < ActiveRecord::Base
  has_and_belongs_to_many :teacher_exams
  has_many :teacher_answers
  has_many :questions
  accepts_nested_attributes_for :teacher_answers, :allow_destroy => true

  QUESTION_TYPES = ['radio_button', 'check_box', 'text_field'].freeze

  validates_inclusion_of :question_type, :in => QUESTION_TYPES
  validate_on_update :question_type_not_changed
  # FIXME: validate :method, :on => :update does not work
  private

  def question_type_not_changed
    errors.add :question_type, 'can not be changed' if question_type_changed?
  end
end
