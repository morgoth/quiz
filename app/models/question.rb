class Question < ActiveRecord::Base
  acts_as_list :scope => :exam

  has_many :answers, :order => "position", :dependent => :destroy
  belongs_to :exam
  belongs_to :teacher_question

  validates_presence_of :teacher_question, :exam, :state
  after_create :set_teacher_answers

  def content
    teacher_question.content
  end

  def sum_points
    answers.map { |a| a.points }.compact.inject { |sum, a| sum += a }
  end

  def update_answers=(value)
    if value.kind_of? Hash
      answers.each do |answer|
        value.values.flatten.include?(answer.id.to_s) ? answer.update_attributes(:value => 'true') : answer.update_attributes(:value => 'false')
      end
    end
  end

  state_machine :initial => :prepared do
    event :visit do
      transition [:prepared, :visited] => :visited
    end
  end

  private

  def set_teacher_answers
    teacher_question.teacher_answers.shuffle.each do |teacher_answer|
      answers.create(:teacher_answer_id => teacher_answer.id, :points => 0)
    end
  end
end
