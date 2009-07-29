class TeacherQuestion < ActiveRecord::Base
  acts_as_taggable_on :tags

  has_and_belongs_to_many :teacher_exams
  belongs_to :teacher
  has_many :teacher_answers, :dependent => :destroy
  has_many :questions, :dependent => :destroy
  has_one :picture, :as => :imageable, :dependent => :destroy

  accepts_nested_attributes_for :teacher_answers, :allow_destroy => true
  accepts_nested_attributes_for :picture

  QUESTION_TYPES = ['radio_button', 'check_box', 'text_field'].freeze

  validates_inclusion_of :question_type, :in => QUESTION_TYPES
  validate_on_update :question_type_not_changed

  def max_points
    teacher_answers.map { |q| q.points if q.points > 0 }.compact.inject { |sum, q| sum += q }
  end

  private

  def question_type_not_changed
    errors.add :question_type, 'can not be changed' if question_type_changed?
  end
end
