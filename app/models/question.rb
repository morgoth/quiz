class Question < ActiveRecord::Base
  belongs_to :exam
  belongs_to :teacher_question

  validates_presence_of :teacher_question, :exam

  def content
    teacher_question.content
  end
end
