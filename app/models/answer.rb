class Answer < ActiveRecord::Base
  acts_as_list :scope => :question

  belongs_to :question
  belongs_to :teacher_answer

  validates_presence_of :question, :teacher_answer

  def content
    teacher_answer.content
  end
end
