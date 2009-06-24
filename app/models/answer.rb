class Answer < ActiveRecord::Base
  acts_as_list :scope => :question

  belongs_to :question
  belongs_to :teacher_answer

  validates_presence_of :question, :teacher_answer

  before_update :calculate_points

  def content
    teacher_answer.content
  end

  private

  def calculate_points
    if value == 'true'
      self.points = teacher_answer.points
    elsif value == 'false'
      self.points = 0
    end
  end
end
