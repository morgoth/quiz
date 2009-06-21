class Question < ActiveRecord::Base
  acts_as_list :scope => :exam

  has_many :answers, :order => "position"
  belongs_to :exam
  belongs_to :teacher_question

  validates_presence_of :teacher_question, :exam
  after_create :set_teacher_answers

  def content
    teacher_question.content
  end

  private

  def set_teacher_answers
    teacher_question.teacher_answers.shuffle.each do |teacher_answer|
      answers.create(:teacher_answer_id => teacher_answer.id, :points => 0)
    end
  end
end
