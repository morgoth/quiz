class Answer < ActiveRecord::Base
  acts_as_list :scope => :question

  belongs_to :question
  belongs_to :teacher_answer

  validates_presence_of :question, :teacher_answer

  before_update :calculate_points

  delegate :content, :to => :teacher_answer

  private

  def calculate_points
    case question.teacher_question.question_type
    when 'check_box', 'radio_button'
      self.points = value == 'true' ? teacher_answer.points : 0
    when 'text_field'
      self.points = teacher_answer.content =~ /#{value}/i ? teacher_answer.points : 0
    end
  end
end
