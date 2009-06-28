class Question < ActiveRecord::Base
  acts_as_list :scope => :exam

  has_many :answers, :order => "position", :dependent => :destroy
  belongs_to :exam
  belongs_to :teacher_question

  validates_presence_of :teacher_question, :exam, :state
  after_create :set_teacher_answers

  delegate :content, :to => :teacher_question

  def sum_points
    answers.map { |a| a.points }.compact.inject { |sum, a| sum += a }
  end

  def update_answers=(value)
    case value.keys.first
    when 'radio_button', 'check_box'
      answers.each do |answer|
        value.values.flatten.include?(answer.id.to_s) ? answer.update_attributes(:value => 'true') : answer.update_attributes(:value => 'false')
      end
    when 'text_field'
      answers.first.update_attributes(:value => value.values.first)
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
