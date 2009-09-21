class TeacherQuestion < ActiveRecord::Base
  QUESTION_TYPES = ['radio_button', 'check_box', 'text_field'].freeze
  acts_as_taggable_on :tags

  has_and_belongs_to_many :teacher_exams
  belongs_to :teacher
  has_many :teacher_answers, :dependent => :destroy
  has_many :questions
  has_one :picture, :as => :imageable, :dependent => :destroy

  validates_inclusion_of :question_type, :in => QUESTION_TYPES
  validate_on_update :question_type_not_changed

  before_destroy :destroyable?

  accepts_nested_attributes_for :teacher_answers, :allow_destroy => true
  accepts_nested_attributes_for :picture

  def max_points
    if question_type == 'radio_button'
      teacher_answers.map { |q| q.points }.compact.max
    else
      teacher_answers.map { |q| q.points if q.points > 0 }.compact.inject { |sum, q| sum += q }
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
